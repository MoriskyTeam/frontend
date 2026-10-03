import 'package:domain/src/model/result/incident/air_quality_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_reading.freezed.dart';

/// Latest measurement of a GIOŚ station, µg/m³.
@freezed
sealed class AirReading with _$AirReading {
  const factory AirReading({
    required AirQualityLevel level,
    required double? pm25,
    required double? pm10,
  }) = _AirReading;

  const AirReading._();

  /// The value a station is shown by: PM2.5, or PM10 where the station
  /// measures no PM2.5.
  double? get headline => pm25 ?? pm10;

  /// Whether [headline] is the PM10 fallback.
  bool get headlineIsPm10 => pm25 == null && pm10 != null;
}
