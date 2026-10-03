part of 'map_cubit.dart';

@immutable
sealed class MapEvent {
  const MapEvent();
}

class MapErrorOccurred extends MapEvent {
  const MapErrorOccurred(this.error);

  final ErrorResult error;
}

/// A new incident arrived over the live feed (not one the resident filed).
class IncidentArrived extends MapEvent {
  const IncidentArrived(this.incident);

  final Incident incident;
}
