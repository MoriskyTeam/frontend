import 'package:freezed_annotation/freezed_annotation.dart';

part 'synop_reading_dto.freezed.dart';
part 'synop_reading_dto.g.dart';

/// Row of the `imgw_synop_readings` table: a station's latest observation.
@freezed
sealed class SynopReadingDTO with _$SynopReadingDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SynopReadingDTO({
    required int? stationId,
    required double? temperature,
    required double? windSpeed,
    required int? windDirection,
    required double? humidity,
    required double? precipitation,
    required double? pressure,
    required DateTime? measuredAt,
    required DateTime? updatedAt,
  }) = _SynopReadingDTO;

  factory SynopReadingDTO.fromJson(Map<String, dynamic> json) =>
      _$SynopReadingDTOFromJson(json);
}
