import 'package:freezed_annotation/freezed_annotation.dart';

part 'gios_reading_dto.freezed.dart';
part 'gios_reading_dto.g.dart';

/// Row of the `gios_readings` table: the latest value of one station sensor.
@freezed
sealed class GiosReadingDTO with _$GiosReadingDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GiosReadingDTO({
    required int? sensorId,
    required int? stationId,
    required String? pollutant,
    required double? value,
    required DateTime? measuredAt,
    required DateTime? updatedAt,
  }) = _GiosReadingDTO;

  factory GiosReadingDTO.fromJson(Map<String, dynamic> json) =>
      _$GiosReadingDTOFromJson(json);
}
