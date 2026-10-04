import 'dart:developer' as developer;

import 'package:cross_file/cross_file.dart';
import 'package:data/src/mapper/incident_mappers.dart';
import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';
import 'package:data/src/model/incident/update_report_dto.dart';
import 'package:data/src/service/incident/incident_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

/// Incidents from the `incidents` table, kept live through Supabase
/// Realtime. Schema contract: `docs/supabase_contract.md`.
@LazySingleton(as: IncidentService)
class SupabaseIncidentService implements IncidentService {
  SupabaseIncidentService(this._client);

  static const _table = 'incidents';
  static const _photoBucket = 'report-photos';

  final SupabaseClient _client;
  final _uuid = const Uuid();

  String? get _userId => _client.auth.currentUser?.id;

  @override
  Stream<List<IncidentDTO>> watchIncidents() => _client
      .from(_table)
      .stream(primaryKey: ['id'])
      .order('reported_at')
      .map((rows) => [for (final row in rows) _fromRow(row)]);

  @override
  Future<IncidentDTO> submitReport({required SubmitReportDTO data}) async {
    // RLS only accepts reports filed as the signed-in resident; fail loudly
    // instead of sending `reporter_id: null` and losing the photo.
    final userId =
        _userId ??
        (throw const ApiException(
          kind: ApiErrorKind.unauthorized,
          message: 'No Supabase session for the report',
        ));
    final photoPath = data.photoPath;
    final photoUrl = photoPath == null
        ? null
        : await _uploadPhoto(path: photoPath, userId: userId);

    final row = await _client
        .from(_table)
        .insert({
          'id': 'res-${_uuid.v4()}',
          'layer': 'neighbours',
          'category': data.category,
          'severity': 'medium',
          'status': 'reported',
          'source': 'resident',
          'title': data.title,
          'description': data.description,
          'address': data.address,
          'lat': data.lat,
          'lng': data.lng,
          'photo_path': photoUrl,
          'reporter_id': userId,
        })
        .select()
        .single();
    return _fromRow(row);
  }

  @override
  Future<IncidentDTO> confirmIncident({required String incidentId}) async {
    final row = await _client.rpc<Map<String, dynamic>>(
      'confirm_incident',
      params: {'p_incident_id': incidentId},
    );
    return _fromRow(row);
  }

  @override
  Future<IncidentDTO> updateReport({required UpdateReportDTO data}) async {
    final userId =
        _userId ??
        (throw const ApiException(
          kind: ApiErrorKind.unauthorized,
          message: 'No Supabase session for the edit',
        ));
    final newPhoto = data.newPhotoPath;
    final photoUrl = newPhoto != null
        ? await _uploadPhoto(path: newPhoto, userId: userId)
        : data.keepPhotoUrl;

    final row = await _client.rpc<Map<String, dynamic>>(
      'update_my_report',
      params: {
        'p_id': data.id,
        'p_category': data.category,
        'p_title': data.title,
        'p_description': data.description,
        'p_photo_path': photoUrl,
      },
    );

    final previous = data.previousPhotoUrl;
    if (previous != null && previous != photoUrl) {
      await _removePhoto(previous);
    }
    return _fromRow(row);
  }

  @override
  Future<void> deleteReport({
    required String incidentId,
    String? photoUrl,
  }) async {
    await _client.rpc<void>(
      'delete_my_report',
      params: {'p_id': incidentId},
    );
    if (photoUrl != null) await _removePhoto(photoUrl);
  }

  /// Best effort: the report change already succeeded, so a photo left
  /// behind is only storage, never a failure for the resident.
  Future<void> _removePhoto(String url) async {
    final path = url.toReportPhotoObjectPath();
    if (path == null) return;
    try {
      await _client.storage.from(_photoBucket).remove([path]);
    } on Object catch (error) {
      developer.log('Photo not removed: $error', name: 'incidents');
    }
  }

  Future<String> _uploadPhoto({
    required String path,
    required String userId,
  }) async {
    final bytes = await XFile(path).readAsBytes();
    final objectPath = '$userId/${_uuid.v4()}.jpg';
    final bucket = _client.storage.from(_photoBucket);
    await bucket.uploadBinary(
      objectPath,
      bytes,
      fileOptions: const FileOptions(contentType: 'image/jpeg'),
    );
    return bucket.getPublicUrl(objectPath);
  }

  IncidentDTO _fromRow(Map<String, dynamic> row) => IncidentDTO.fromJson({
    ...row,
    'reported_by_me':
        row['reporter_id'] != null && row['reporter_id'] == _userId,
  });
}
