import 'package:domain/src/model/result/incident/incident_category.dart';
import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_report_request.freezed.dart';

@freezed
sealed class SubmitReportRequest with _$SubmitReportRequest {
  const factory SubmitReportRequest({
    required IncidentCategory category,

    /// Human-readable headline, e.g. the localised category name.
    required String title,
    required GeoPoint location,

    /// Street address of [location], when it could be resolved.
    required String? address,
    required String description,
    required String? photoPath,
  }) = _SubmitReportRequest;
}
