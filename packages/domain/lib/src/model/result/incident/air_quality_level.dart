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
}
