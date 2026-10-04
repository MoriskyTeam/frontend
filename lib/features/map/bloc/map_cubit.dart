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
    this._getLatestRadarFrame,
    this._registerPushDevice,
    this._deleteReport,
  ) : super(const MapState());

  /// How long an arrival keeps its "just arrived" treatment.
  static const _arrivalWindow = Duration(seconds: 6);
  static const _clockTick = Duration(seconds: 30);

  /// RainViewer publishes a new frame every 10 minutes.
  static const _radarTick = Duration(minutes: 10);

  final WatchIncidentsUseCase _watchIncidents;
  final GetCurrentLocationUseCase _getCurrentLocation;
  final ConfirmIncidentUseCase _confirmIncident;
  final EnsureSignedInUseCase _ensureSignedIn;
  final GetLatestRadarFrameUseCase _getLatestRadarFrame;
  final RegisterPushDeviceUseCase _registerPushDevice;
  final DeleteReportUseCase _deleteReport;

  StreamSubscription<List<Incident>>? _subscription;
  Timer? _clock;
  Timer? _radarClock;
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
    // confirming, which surface their own errors. A failed sign-in must not
    // claim the city feed failed.
    _radarClock = Timer.periodic(_radarTick, (_) => unawaited(_loadRadar()));
    unawaited(_loadRadar());
    await _ensureSignedIn();
    _subscribe();
    await locate();
  }

  Future<void> locate() async {
    final result = await _getCurrentLocation();
    result.fold(
      (error) => emitPresentation(MapErrorOccurred(error)),
      (location) => emit(state.copyWith(userLocation: location)),
    );
    // Danger alarms are matched to the last real position; a demo
    // fallback must never be sent as one.
    final position = state.userLocation;
    unawaited(
      _registerPushDevice(
        position == null || position.isFallback ? null : position.point,
      ),
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

  /// Deletes the resident's own report for everyone. It leaves the map at
  /// once and comes back if the server refuses.
  Future<void> deleteReport(Incident incident) async {
    final before = state.incidents;
    emit(
      state.copyWith(
        incidents: [
          for (final other in before)
            if (other.id != incident.id) other,
        ],
        selectedIncidentId: state.selectedIncidentId == incident.id
            ? null
            : state.selectedIncidentId,
      ),
    );
    final result = await _deleteReport(incident);
    result.fold(
      (error) {
        // Realtime may have moved on meanwhile; restore only what is gone.
        final known = {for (final other in state.incidents) other.id};
        emit(
          state.copyWith(
            incidents: [
              ...state.incidents,
              if (!known.contains(incident.id)) incident,
            ],
          ),
        );
        emitPresentation(ReportDeleteFailed(error));
      },
      (_) => emitPresentation(const ReportDeleted()),
    );
  }

  /// Marks an incident the resident just filed so it gets the arrival
  /// treatment and the camera goes to it.
  void focusOwnReport(Incident incident) {
    _markArrived(incident.id);
    select(incident.id);
  }

  /// The radar is decoration on top of the weather layer: a failed fetch
  /// keeps the last frame (or none) and stays silent.
  Future<void> _loadRadar() async {
    final result = await _getLatestRadarFrame();
    if (isClosed) return;
    result.fold(
      (_) {},
      (frame) => emit(state.copyWith(radarFrame: frame ?? state.radarFrame)),
    );
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
    _radarClock?.cancel();
    for (final timer in _arrivalTimers.values) {
      timer.cancel();
    }
    return super.close();
  }
}
