import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'map_cubit.freezed.dart';
part 'map_event.dart';
part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState>
    with BlocPresentationMixin<MapState, MapEvent> {
  MapCubit(
    this._watchIncidents,
    this._getCurrentLocation,
    this._confirmIncident,
    this._ensureSignedIn,
  ) : super(const MapState());

  /// How long an arrival keeps its "just arrived" treatment.
  static const _arrivalWindow = Duration(seconds: 6);
  static const _clockTick = Duration(seconds: 30);

  final WatchIncidentsUseCase _watchIncidents;
  final GetCurrentLocationUseCase _getCurrentLocation;
  final ConfirmIncidentUseCase _confirmIncident;
  final EnsureSignedInUseCase _ensureSignedIn;

  StreamSubscription<List<Incident>>? _subscription;
  Timer? _clock;
  final _arrivalTimers = <String, Timer>{};
  String? _pendingFocusId;

  /// [focusIncidentId] opens a shared link straight at one incident.
  Future<void> init({String? focusIncidentId}) async {
    _pendingFocusId = focusIncidentId;
    emit(
      state.copyWith(
        loadingStatus: LoadingStatus.loading,
        now: DateTime.now(),
      ),
    );
    _clock = Timer.periodic(
      _clockTick,
      (_) => emit(state.copyWith(now: DateTime.now())),
    );
    // Reading is public; the identity only matters for reporting and
    // confirming, so a failed sign-in is reported but does not block the map.
    final signIn = await _ensureSignedIn();
    signIn.fold((error) => emitPresentation(MapErrorOccurred(error)), (_) {});
    _subscribe();
    await locate();
  }

  Future<void> locate() async {
    final result = await _getCurrentLocation();
    result.fold(
      (error) => emitPresentation(MapErrorOccurred(error)),
      (location) => emit(state.copyWith(userLocation: location)),
    );
  }

  void retry() {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    _subscribe();
  }

  void toggleLayer(IncidentLayer layer) {
    final layers = {...state.enabledLayers};
    if (!layers.remove(layer)) layers.add(layer);
    final selected = state.incidents
        .where((incident) => incident.id == state.selectedIncidentId)
        .firstOrNull;
    emit(
      state.copyWith(
        enabledLayers: layers,
        selectedIncidentId: selected != null && !layers.contains(selected.layer)
            ? null
            : state.selectedIncidentId,
      ),
    );
  }

  void enableAllLayers() =>
      emit(state.copyWith(enabledLayers: IncidentLayer.values.toSet()));

  void select(String? incidentId) {
    final selected = state.incidents
        .where((incident) => incident.id == incidentId)
        .firstOrNull;
    // Selecting something on a hidden layer (e.g. from a snackbar) turns the
    // layer back on rather than selecting an invisible marker.
    final layers = selected == null
        ? state.enabledLayers
        : {...state.enabledLayers, selected.layer};
    emit(
      state.copyWith(
        selectedIncidentId: incidentId,
        enabledLayers: layers,
      ),
    );
  }

  Future<void> confirm(String incidentId) async {
    if (state.confirmedByMe.contains(incidentId)) return;
    emit(
      state.copyWith(confirmedByMe: {...state.confirmedByMe, incidentId}),
    );
    final result = await _confirmIncident(incidentId);
    result.fold(
      (error) {
        emit(
          state.copyWith(
            confirmedByMe: {...state.confirmedByMe}..remove(incidentId),
          ),
        );
        emitPresentation(MapErrorOccurred(error));
      },
      (_) {},
    );
  }

  /// Marks an incident the resident just filed so it gets the arrival
  /// treatment and the camera goes to it.
  void focusOwnReport(Incident incident) {
    _markArrived(incident.id);
    select(incident.id);
  }

  void _subscribe() {
    unawaited(_subscription?.cancel());
    _subscription = _watchIncidents.watch().listen(
      _onIncidents,
      onError: (Object error) {
        emit(state.copyWith(loadingStatus: LoadingStatus.error));
        emitPresentation(
          MapErrorOccurred(UnknownError(message: '$error', cause: error)),
        );
      },
    );
  }

  void _onIncidents(List<Incident> incidents) {
    final isFirstLoad = !state.loadingStatus.isLoaded;
    final knownIds = {for (final incident in state.incidents) incident.id};
    emit(
      state.copyWith(
        incidents: incidents,
        loadingStatus: LoadingStatus.loaded,
        now: DateTime.now(),
      ),
    );
    if (isFirstLoad) {
      final focusId = _pendingFocusId;
      _pendingFocusId = null;
      if (focusId != null) select(focusId);
      return;
    }

    for (final incident in incidents) {
      if (knownIds.contains(incident.id)) continue;
      _markArrived(incident.id);
      if (!incident.reportedByMe) emitPresentation(IncidentArrived(incident));
    }
  }

  void _markArrived(String incidentId) {
    emit(state.copyWith(arrivedIds: {...state.arrivedIds, incidentId}));
    _arrivalTimers[incidentId]?.cancel();
    _arrivalTimers[incidentId] = Timer(_arrivalWindow, () {
      _arrivalTimers.remove(incidentId);
      if (isClosed) return;
      emit(
        state.copyWith(
          arrivedIds: {...state.arrivedIds}..remove(incidentId),
        ),
      );
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    _clock?.cancel();
    for (final timer in _arrivalTimers.values) {
      timer.cancel();
    }
    return super.close();
  }
}
