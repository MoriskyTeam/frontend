import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_report_dto.freezed.dart';
part 'update_report_dto.g.dart';

/// A resident's edit of their own report, as `update_my_report` takes it.
/// At most one of [keepPhotoUrl] and [newPhotoPath] is set; neither means
/// the report ends up without a photo.
@freezed
sealed class UpdateReportDTO with _$UpdateReportDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UpdateReportDTO({
    required String? id,
    required String? category,
    required String? title,
    required String? description,
    required String? keepPhotoUrl,

    /// Local file to upload in place of the current photo.
    required String? newPhotoPath,
    required String? previousPhotoUrl,
  }) = _UpdateReportDTO;

  factory UpdateReportDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportDTOFromJson(json);
}
