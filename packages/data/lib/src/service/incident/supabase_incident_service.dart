import 'package:cross_file/cross_file.dart';
import 'package:data/src/di/data_environment.dart';
import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';
import 'package:data/src/service/incident/incident_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

/// Incidents from the `incidents` table, kept live through Supabase
/// Realtime. Schema contract: `docs/supabase_contract.md`.
@supabaseEnv
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
    final userId = _userId;
    final photoUrl = data.photoPath == null || userId == null
        ? null
        : await _uploadPhoto(path: data.photoPath!, userId: userId);

    final row = await _client
        .from(_table)
        .insert({
          'id': 'res-${_uuid.v4()}',
          'layer': 'neighbours',
          'category': data.category,
          'severity': 'medium',
          'status': 'reported',
          'source': 'resident',
          'description': data.description,
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
