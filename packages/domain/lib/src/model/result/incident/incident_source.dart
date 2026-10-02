/// Where an incident came from. Official sources and residents must stay
/// distinguishable everywhere the incident is shown.
enum IncidentSource {
  city19115,
  utility,
  imgw,
  gios,
  resident
  ;

  bool get isOfficial => this != IncidentSource.resident;
}
