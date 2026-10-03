import 'dart:developer';

import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/mapper/air_quality_mappers.dart';
import 'package:data/src/mapper/incident_mappers.dart';
import 'package:data/src/model/air_quality/gios_reading_dto.dart';
import 'package:data/src/model/air_quality/gios_station_dto.dart';
import 'package:data/src/service/air_quality/air_quality_service.dart';
import 'package:data/src/service/auth/auth_service.dart';
import 'package:data/src/service/incident/incident_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(as: IncidentRepository)
class IncidentRepositoryImpl extends IncidentRepository {
  IncidentRepositoryImpl(this._service, this._airQuality, this._auth);

  final IncidentService _service;
  final AirQualityService _airQuality;
  final AuthService _auth;

  /// Incidents plus the GIOŚ stations as air-quality incidents. Emits once
  /// every source has delivered, so the first load lands as one batch. Air
  /// rows left in `incidents` are ignored: the GIOŚ tables are the only
  /// air-quality source, and an air outage only empties that layer.
  @override
  Stream<List<Incident>> watchIncidents() => Rx.combineLatest3(
    _service.watchIncidents(),
    _airQuality.watchStations().onErrorReturnWith(
      (error, _) => _airUnavailable(error, const <GiosStationDTO>[]),
    ),
    _airQuality.watchReadings().onErrorReturnWith(
      (error, _) => _airUnavailable(error, const <GiosReadingDTO>[]),
    ),
    (incidents, stations, readings) => [
      for (final dto in incidents)
        if (dto.toDomain() case final incident
            when incident.layer != IncidentLayer.airQuality)
          incident,
      ...stations.toAirIncidents(readings: readings),
    ],
  );

  /// Logged, not swallowed: an empty air layer should never be a mystery.
  static List<T> _airUnavailable<T>(Object error, List<T> empty) {
    log('GIOŚ data unavailable: $error', name: 'IncidentRepository');
    return empty;
  }

  @override
  Future<Incident> submitReport({
    required SubmitReportRequest request,
  }) async {
    try {
      // Writes are attributed to the resident; never rely on the map having
      // finished signing in first.
      await _auth.ensureSignedIn();
      final dto = await _service.submitReport(data: request.toData());
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }

  @override
  Future<Incident> confirmIncident({required String incidentId}) async {
    try {
      await _auth.ensureSignedIn();
      final dto = await _service.confirmIncident(incidentId: incidentId);
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }
}
