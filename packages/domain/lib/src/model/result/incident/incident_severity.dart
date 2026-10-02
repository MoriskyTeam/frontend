/// How much an incident should interrupt the resident.
enum IncidentSeverity {
  low,
  medium,
  high
  ;

  bool get isHigh => this == IncidentSeverity.high;
}
