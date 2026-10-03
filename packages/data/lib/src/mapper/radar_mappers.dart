import 'package:data/src/model/radar/radar_frame_dto.dart';
import 'package:data/src/model/radar/weather_maps_dto.dart';
import 'package:domain/domain.dart';

extension WeatherMapsDTOMapper on WeatherMapsDTO {
  /// The newest past frame, or null when the index has none.
  ///
  /// Tiles are 256 px, colour scheme 2 (universal blue), smoothed, with
  /// snow shown; the free API renders up to zoom 7.
  RadarFrame? toDomain() {
    final host = this.host;
    final frames = [
      for (final frame in radar?.past ?? const <RadarFrameDTO>[])
        if (frame.time != null && frame.path != null) frame,
    ];
    if (host == null || frames.isEmpty) return null;
    final latest = frames.reduce((a, b) => a.time! >= b.time! ? a : b);
    return RadarFrame(
      tileUrlTemplate: '$host${latest.path}/256/{z}/{x}/{y}/2/1_1.png',
      time: DateTime.fromMillisecondsSinceEpoch(latest.time! * 1000),
      maxNativeZoom: 7,
    );
  }
}
