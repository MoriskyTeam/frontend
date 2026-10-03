part of 'map_cubit.dart';

@freezed
sealed class MapState with _$MapState {
  const factory MapState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Incident> incidents,
    @Default({
      IncidentLayer.infrastructure,
      IncidentLayer.airQuality,
      IncidentLayer.weather,
      IncidentLayer.neighbours,
    })
    Set<IncidentLayer> enabledLayers,
    @Default(null) String? selectedIncidentId,
    @Default(null) UserLocation? userLocation,
    @Default({}) Set<String> arrivedIds,
    @Default({}) Set<String> confirmedByMe,
    @Default(null) DateTime? now,
  }) = _MapState;
}
