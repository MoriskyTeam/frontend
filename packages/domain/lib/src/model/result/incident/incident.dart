import 'package:domain/src/model/result/incident/air_reading.dart';
import 'package:domain/src/model/result/incident/incident_category.dart';
import 'package:domain/src/model/result/incident/incident_layer.dart';
import 'package:domain/src/model/result/incident/incident_severity.dart';
import 'package:domain/src/model/result/incident/incident_source.dart';
import 'package:domain/src/model/result/incident/incident_status.dart';
import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident.freezed.dart';

/// One thing happening in the city: an outage, a warning, a station reading
/// or a resident report.
@freezed
sealed class Incident with _$Incident {
  const factory Incident({
    required String id,
    required IncidentLayer layer,
    required IncidentCategory category,
    required IncidentSeverity severity,
    required IncidentStatus status,
    required IncidentSource source,
    required String title,
    required String description,
    required String address,
    required GeoPoint location,
    required DateTime reportedAt,
    required DateTime? updatedAt,
    required int confirmations,
    required int? areaRadiusMeters,
    required AirReading? airReading,
    required String? photoPath,

    /// True when the current resident filed this report.
    required bool reportedByMe,
  }) = _Incident;
}
