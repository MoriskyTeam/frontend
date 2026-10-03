import 'dart:async';

import 'package:data/src/di/data_environment.dart';
import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';
import 'package:data/src/service/incident/incident_service.dart';
import 'package:data/src/service/incident/mock_incident_seed.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

/// In-memory stand-in for the live backend feed (WebSocket / SSE).
///
/// Seeds the Kraków demo data, then pushes one event from [mockLiveQueue]
/// every [_liveInterval] to simulate real-time arrivals. Kept a singleton so
/// every subscriber sees the same city.
@mockEnv
@LazySingleton(as: IncidentService)
class MockIncidentService implements IncidentService {
  MockIncidentService() {
    final now = DateTime.now();
    _incidents = [
      for (final json in mockIncidentSeed) _fromSeed(json, now),
    ];
  }

  static const _liveInterval = Duration(seconds: 25);
  static const _firstLiveDelay = Duration(seconds: 12);
  static const _confirmationsToConfirm = 3;

  final _uuid = const Uuid();
  final _controller = StreamController<List<IncidentDTO>>.broadcast();
  late List<IncidentDTO> _incidents;
  Timer? _liveTimer;
  int _liveCursor = 0;

  @override
  Stream<List<IncidentDTO>> watchIncidents() {
    _startLiveFeed();
    return Stream<List<IncidentDTO>>.multi((controller) {
      controller.add(List.unmodifiable(_incidents));
      final subscription = _controller.stream.listen(
        controller.add,
        onError: controller.addError,
      );
      controller.onCancel = subscription.cancel;
    });
  }

  @override
  Future<IncidentDTO> submitReport({required SubmitReportDTO data}) async {
    // Simulated round-trip so the UI's sending state is visible.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    final now = DateTime.now();
    final incident = IncidentDTO(
      id: 'res-${_uuid.v4()}',
      layer: 'neighbours',
      category: data.category,
      severity: 'medium',
      status: 'reported',
      source: 'resident',
      title: null,
      description: data.description,
      address: null,
      lat: data.lat,
      lng: data.lng,
      reportedAt: now,
      updatedAt: now,
      confirmations: 0,
      areaRadiusMeters: null,
      airReading: null,
      photoPath: data.photoPath,
      reportedByMe: true,
    );
    _publish([incident, ..._incidents]);
    return incident;
  }

  @override
  Future<IncidentDTO> confirmIncident({required String incidentId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    late IncidentDTO updated;
    _publish([
      for (final incident in _incidents)
        if (incident.id == incidentId)
          updated = _confirmed(incident)
        else
          incident,
    ]);
    return updated;
  }

  IncidentDTO _confirmed(IncidentDTO incident) {
    final confirmations = (incident.confirmations ?? 0) + 1;
    return incident.copyWith(
      confirmations: confirmations,
      status:
          incident.status == 'reported' &&
              confirmations >= _confirmationsToConfirm
          ? 'confirmed'
          : incident.status,
      updatedAt: DateTime.now(),
    );
  }

  void _startLiveFeed() {
    if (_liveTimer != null) return;
    _liveTimer = Timer(_firstLiveDelay, () {
      _pushNextLive();
      _liveTimer = Timer.periodic(_liveInterval, (_) => _pushNextLive());
    });
  }

  void _pushNextLive() {
    if (_liveCursor >= mockLiveQueue.length) {
      _liveTimer?.cancel();
      return;
    }
    final next = _fromSeed(mockLiveQueue[_liveCursor++], DateTime.now());
    _publish([next, ..._incidents]);
  }

  void _publish(List<IncidentDTO> incidents) {
    _incidents = incidents;
    _controller.add(List.unmodifiable(incidents));
  }

  IncidentDTO _fromSeed(Map<String, dynamic> json, DateTime now) {
    final minutesAgo = json['minutes_ago'] as int? ?? 0;
    final reportedAt = now.subtract(Duration(minutes: minutesAgo));
    return IncidentDTO.fromJson({
      ...json,
      'reported_at': reportedAt.toIso8601String(),
      'updated_at': reportedAt.toIso8601String(),
    });
  }
}
