/// GIOŚ Polish air-quality index, best to worst.
enum AirQualityLevel {
  veryGood,
  good,
  moderate,
  sufficient,
  bad,
  veryBad
  ;

  bool get isUnhealthy => index >= AirQualityLevel.sufficient.index;

  // Upper bounds (µg/m³, 1 h mean) of each GIOŚ index band, best to worst;
  // anything above the last bound is [veryBad].
  static const _pm25Bounds = [13.0, 35.0, 55.0, 75.0, 110.0];
  static const _pm10Bounds = [20.0, 50.0, 80.0, 110.0, 150.0];

  /// The station's index is the worst of its pollutant sub-indices, so the
  /// shown grade can never disagree with the shown readings.
  static AirQualityLevel? fromReadings({double? pm25, double? pm10}) {
    final levels = [
      if (pm25 != null) _band(pm25, _pm25Bounds),
      if (pm10 != null) _band(pm10, _pm10Bounds),
    ];
    if (levels.isEmpty) return null;
    return levels.reduce((a, b) => a.index >= b.index ? a : b);
  }

  static AirQualityLevel _band(double value, List<double> bounds) {
    for (var i = 0; i < bounds.length; i++) {
      if (value <= bounds[i]) return AirQualityLevel.values[i];
    }
    return AirQualityLevel.veryBad;
  }
}
