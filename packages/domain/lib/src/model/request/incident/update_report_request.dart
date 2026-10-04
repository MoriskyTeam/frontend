import 'package:domain/src/model/result/incident/incident_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_report_request.freezed.dart';

/// What happens to a report's photo on edit.
@freezed
sealed class ReportPhoto with _$ReportPhoto {
  /// No photo, or the existing one dropped.
  const factory ReportPhoto.none() = ReportPhotoNone;

  /// The photo already online stays as it is.
  const factory ReportPhoto.keep({required String url}) = ReportPhotoKeep;

  /// A new photo from the device replaces whatever was there.
  const factory ReportPhoto.replace({required String localPath}) =
      ReportPhotoReplace;
}

/// A resident's change to their own report. The place stays fixed:
/// neighbours confirmed that spot.
@freezed
sealed class UpdateReportRequest with _$UpdateReportRequest {
  const factory UpdateReportRequest({
    required String incidentId,
    required IncidentCategory category,

    /// Headline shown on every map, e.g. the localised category name.
    required String title,
    required String description,
    required ReportPhoto photo,

    /// The photo the report had before the edit, removed from storage when
    /// it is replaced or dropped.
    required String? previousPhotoUrl,
  }) = _UpdateReportRequest;
}
