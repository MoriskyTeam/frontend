/// Map layers a resident can toggle. Each maps to one data origin family.
enum IncidentLayer {
  /// City issue reports (19115, utilities: power, water, heating, roads).
  infrastructure,

  /// GIOŚ air-quality stations.
  airQuality,

  /// IMGW meteorological warnings.
  weather,

  /// Micro-reports filed by residents.
  neighbours,
}
