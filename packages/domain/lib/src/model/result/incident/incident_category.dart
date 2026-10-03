import 'package:domain/src/model/result/incident/incident_layer.dart';

/// What kind of problem an incident describes.
enum IncidentCategory {
  powerOutage(IncidentLayer.infrastructure),
  waterOutage(IncidentLayer.infrastructure),
  heating(IncidentLayer.infrastructure),
  flooding(IncidentLayer.infrastructure),
  fallenTree(IncidentLayer.infrastructure),
  road(IncidentLayer.infrastructure),
  trafficLights(IncidentLayer.infrastructure),
  streetLights(IncidentLayer.infrastructure),
  airQuality(IncidentLayer.airQuality),
  storm(IncidentLayer.weather),
  wind(IncidentLayer.weather),
  heat(IncidentLayer.weather),
  weatherStation(IncidentLayer.weather),
  smoke(IncidentLayer.neighbours),
  other(IncidentLayer.neighbours)
  ;

  const IncidentCategory(this.defaultLayer);

  /// Layer an official record of this category belongs to. Resident reports
  /// always land on [IncidentLayer.neighbours] regardless of category.
  final IncidentLayer defaultLayer;

  /// Categories a resident can pick in the quick report form.
  static const List<IncidentCategory> reportable = [
    powerOutage,
    waterOutage,
    flooding,
    fallenTree,
    road,
    smoke,
    trafficLights,
    other,
  ];
}
