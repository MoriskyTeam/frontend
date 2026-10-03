import 'package:freezed_annotation/freezed_annotation.dart';

part 'synop_station_dto.freezed.dart';
part 'synop_station_dto.g.dart';

/// Row of the `imgw_synop_stations` table: an IMGW synoptic station.
@freezed
sealed class SynopStationDTO with _$SynopStationDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SynopStationDTO({
    required int? stationId,
    required String? name,
    required double? lat,
    required double? lng,
  }) = _SynopStationDTO;

  factory SynopStationDTO.fromJson(Map<String, dynamic> json) =>
      _$SynopStationDTOFromJson(json);
}
