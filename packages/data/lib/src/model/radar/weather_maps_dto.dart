import 'package:data/src/model/radar/radar_frames_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_maps_dto.freezed.dart';
part 'weather_maps_dto.g.dart';

/// RainViewer's public `weather-maps.json` index.
@freezed
sealed class WeatherMapsDTO with _$WeatherMapsDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WeatherMapsDTO({
    required String? host,
    required RadarFramesDTO? radar,
  }) = _WeatherMapsDTO;

  factory WeatherMapsDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherMapsDTOFromJson(json);
}
