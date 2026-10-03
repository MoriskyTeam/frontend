import 'package:domain/src/model/result/incident/incident_category.dart';
import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_report_request.freezed.dart';

@freezed
sealed class SubmitReportRequest with _$SubmitReportRequest {
  const factory SubmitReportRequest({
    required IncidentCategory category,
    required GeoPoint location,
    required String description,
    required String? photoPath,
  }) = _SubmitReportRequest;
}
