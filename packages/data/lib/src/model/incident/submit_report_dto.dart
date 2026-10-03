import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_report_dto.freezed.dart';
part 'submit_report_dto.g.dart';

@freezed
sealed class SubmitReportDTO with _$SubmitReportDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SubmitReportDTO({
    required String? category,
    required double? lat,
    required double? lng,
    required String? description,
    required String? photoPath,
  }) = _SubmitReportDTO;

  factory SubmitReportDTO.fromJson(Map<String, dynamic> json) =>
      _$SubmitReportDTOFromJson(json);
}
