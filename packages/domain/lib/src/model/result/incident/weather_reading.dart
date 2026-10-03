import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_reading.freezed.dart';

/// Latest observation of an IMGW synoptic station.
@freezed
sealed class WeatherReading with _$WeatherReading {
  const factory WeatherReading({
    /// °C.
    required double? temperature,

    /// m/s.
    required double? windSpeed,

    /// Degrees the wind blows from, 0 = north; null or 0 at calm.
    required int? windDirection,

    /// %.
    required double? humidity,

    /// mm.
    required double? precipitation,

    /// hPa.
    required double? pressure,
  }) = _WeatherReading;
}
