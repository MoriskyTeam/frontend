/// Lifecycle of an incident as the resident sees it.
enum IncidentStatus {
  /// Just reported, not yet corroborated.
  reported,

  /// Confirmed by the city / operator or by several residents.
  confirmed,

  /// Fixed or expired.
  resolved,
}
