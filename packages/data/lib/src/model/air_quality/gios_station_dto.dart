import 'package:freezed_annotation/freezed_annotation.dart';

part 'gios_station_dto.freezed.dart';
part 'gios_station_dto.g.dart';

/// Row of the `gios_stations` table: a GIOŚ station measuring PM.
@freezed
sealed class GiosStationDTO with _$GiosStationDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GiosStationDTO({
    required int? stationId,
    required String? code,
    required String? name,
    required String? city,
    required String? street,
    required double? lat,
    required double? lng,
    required int? pm25SensorId,
    required int? pm10SensorId,
  }) = _GiosStationDTO;

  factory GiosStationDTO.fromJson(Map<String, dynamic> json) =>
      _$GiosStationDTOFromJson(json);
}
