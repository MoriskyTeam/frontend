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
}
