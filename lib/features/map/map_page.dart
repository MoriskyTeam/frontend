import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/map/bloc/map_cubit.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/model/map_view_data.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/city_map.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/incident_detail.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/layer_filter_bar.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/live_status_bar.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/nearby_panel.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart' show MapController;
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({this.focusIncidentId, super.key});

  /// Incident to open on load, from a shared `/?incident=<id>` link.
  final String? focusIncidentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<MapCubit>();
        unawaited(cubit.init(focusIncidentId: focusIncidentId));
        return cubit;
      },
      child: const _MapPageCore(),
    );
  }
}

class _MapPageCore extends StatefulWidget {
  const _MapPageCore();

  @override
  State<_MapPageCore> createState() => _MapPageCoreState();
}

class _MapPageCoreState extends State<_MapPageCore> {
  static const _wideBreakpoint = 840.0;
  static const _sheetPeek = 0.34;
  static const _sheetMin = 0.16;
  static const _sheetDetail = 0.58;
  static const _sheetMax = 0.92;

  final _mapController = MapController();
  final _sheetController = DraggableScrollableController();
  final _sheetExtent = ValueNotifier<double>(_sheetPeek);

  @override
  void dispose() {
    _sheetController.dispose();
    _sheetExtent.dispose();
    super.dispose();
  }

  void _select(Incident? incident) =>
      context.read<MapCubit>().select(incident?.id);

  void _syncSheet(MapState state) {
    if (!_sheetController.isAttached) return;
    final target = state.selectedIncidentId == null ? _sheetPeek : _sheetDetail;
    unawaited(
      _sheetController.animateTo(
        target,
        duration: RcbMotion.medium,
        curve: RcbMotion.standard,
      ),
    );
  }

  Future<void> _openReport() async {
    unawaited(HapticFeedback.mediumImpact());
    final cubit = context.read<MapCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final incident = await context.push<Incident>('/report');
    if (incident == null || !mounted) return;
    cubit.focusOwnReport(incident);
    _select(incident);
    messenger.showSnackBar(_snackBar(context, Text(l10n.reportSent)));
  }

  void _onEvent(BuildContext context, MapEvent event) {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    switch (event) {
      case IncidentArrived(:final incident):
        unawaited(HapticFeedback.lightImpact());
        final state = context.read<MapCubit>().state;
        final origin = MapViewData.from(state).origin;
        final distance = formatDistance(
          incident.distanceTo(origin),
          Localizations.localeOf(context).toLanguageTag(),
        );
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            _snackBar(
              context,
              Text(l10n.newNearby(l10n.titleOf(incident), distance)),
              action: SnackBarAction(
                label: l10n.show,
                onPressed: () => _select(incident),
              ),
            ),
          );
      case MapErrorOccurred():
        messenger.showSnackBar(_snackBar(context, Text(l10n.loadFailed)));
    }
  }

  /// On wide layouts the snackbar keeps a phone-like width instead of
  /// spanning the map and covering the report button.
  SnackBar _snackBar(
    BuildContext context,
    Widget content, {
    SnackBarAction? action,
  }) {
    final wide = MediaQuery.sizeOf(context).width >= _wideBreakpoint;
    return SnackBar(
      content: content,
      action: action,
      width: wide ? 388 : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocPresentationListener<MapCubit, MapEvent>(
      listener: _onEvent,
      child: BlocConsumer<MapCubit, MapState>(
        listenWhen: (previous, current) =>
            previous.selectedIncidentId != current.selectedIncidentId,
        listener: (_, state) => _syncSheet(state),
        builder: (context, state) {
          final data = MapViewData.from(state);
          return LayoutBuilder(
            builder: (context, constraints) =>
                constraints.maxWidth >= _wideBreakpoint
                ? _buildWide(context, state, data)
                : _buildCompact(context, state, data, constraints),
          );
        },
      ),
    );
  }

  String _locationLabel(BuildContext context, MapState state) {
    final l10n = AppLocalizations.of(context);
    final location = state.userLocation;
    if (location == null || location.isFallback) return l10n.locationDemo;
    return l10n.locationDevice;
  }

  Widget _panelContent(
    BuildContext context,
    MapState state,
    MapViewData data, {
    required ScrollController? scrollController,
    Widget? header,
  }) {
    final cubit = context.read<MapCubit>();
    final now = state.now ?? DateTime.now();
    final selected = data.selected;
    // One scroll view at a time: the sheet's controller can only drive one.
    return _FadeIn(
      key: ValueKey(selected?.id ?? 'nearby'),
      child: selected != null
          ? IncidentDetail(
              incident: selected,
              origin: data.origin,
              now: now,
              confirmedByMe: state.confirmedByMe.contains(selected.id),
              onClose: () => _select(null),
              onConfirm: () => cubit.confirm(selected.id),
              scrollController: scrollController,
              header: header,
            )
          : NearbyPanel(
              data: data,
              now: now,
              arrivedIds: state.arrivedIds,
              allLayersOff: state.enabledLayers.isEmpty,
              onSelect: _select,
              onEnableAllLayers: cubit.enableAllLayers,
              scrollController: scrollController,
              header: header,
            ),
    );
  }

  Widget _reportButton(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FloatingActionButton.extended(
      heroTag: 'report',
      onPressed: _openReport,
      icon: const Icon(Icons.add_a_photo_outlined),
      label: Text(l10n.reportAction.toUpperCase()),
    );
  }

  Widget _buildCompact(
    BuildContext context,
    MapState state,
    MapViewData data,
    BoxConstraints constraints,
  ) {
    final cubit = context.read<MapCubit>();
    final scheme = Theme.of(context).colorScheme;
    final height = constraints.maxHeight;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CityMap(
              controller: _mapController,
              incidents: data.visible,
              selected: data.selected,
              arrivedIds: state.arrivedIds,
              userLocation: state.userLocation,
              focusInset: () =>
                  height *
                  (state.selectedIncidentId != null
                      ? _sheetDetail
                      : _sheetExtent.value),
              onIncidentTap: _select,
              onMapTap: () => _select(null),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    RcbSpacing.md,
                    RcbSpacing.sm,
                    RcbSpacing.md,
                    RcbSpacing.xs,
                  ),
                  child: LiveStatusBar(
                    activeNearby: data.activeNearby,
                    locationLabel: _locationLabel(context, state),
                  ),
                ),
                LayerFilterBar(
                  enabled: state.enabledLayers,
                  counts: data.counts,
                  onToggle: cubit.toggleLayer,
                  padding: const EdgeInsets.symmetric(
                    horizontal: RcbSpacing.md,
                  ),
                ),
              ],
            ),
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              _sheetExtent.value = notification.extent;
              return false;
            },
            child: DraggableScrollableSheet(
              controller: _sheetController,
              initialChildSize: _sheetPeek,
              minChildSize: _sheetMin,
              maxChildSize: _sheetMax,
              snap: true,
              snapSizes: const [_sheetPeek, _sheetDetail],
              builder: (context, scrollController) => DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerLowest,
                  borderRadius: RcbRadii.sheetBorder,
                  border: Border(
                    top: BorderSide(color: scheme.outlineVariant),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: scheme.shadow,
                      offset: const Offset(0, -2),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: RcbRadii.sheetBorder,
                  child: _panelContent(
                    context,
                    state,
                    data,
                    scrollController: scrollController,
                    header: const _DragHandle(),
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _sheetExtent,
            builder: (context, extent, child) => Positioned(
              right: RcbSpacing.lg,
              bottom: height * extent + RcbSpacing.md,
              child: AnimatedScale(
                duration: RcbMotion.quick,
                scale: extent > 0.66 ? 0 : 1,
                child: child,
              ),
            ),
            child: _reportButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildWide(
    BuildContext context,
    MapState state,
    MapViewData data,
  ) {
    final cubit = context.read<MapCubit>();
    final scheme = Theme.of(context).colorScheme;
    const panelWidth = 420.0;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: panelWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: scheme.surfaceContainerLowest,
                border: Border(
                  right: BorderSide(color: scheme.outlineVariant),
                ),
              ),
              child: SafeArea(
                right: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(RcbSpacing.md),
                      child: LiveStatusBar(
                        activeNearby: data.activeNearby,
                        locationLabel: _locationLabel(context, state),
                      ),
                    ),
                    LayerFilterBar(
                      enabled: state.enabledLayers,
                      counts: data.counts,
                      onToggle: cubit.toggleLayer,
                      wrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: RcbSpacing.md,
                      ),
                    ),
                    const SizedBox(height: RcbSpacing.sm),
                    const Divider(),
                    Expanded(
                      child: _panelContent(
                        context,
                        state,
                        data,
                        scrollController: null,
                        header: const SizedBox(height: RcbSpacing.md),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: CityMap(
                    controller: _mapController,
                    incidents: data.visible,
                    selected: data.selected,
                    arrivedIds: state.arrivedIds,
                    userLocation: state.userLocation,
                    focusInset: () => 0,
                    onIncidentTap: _select,
                    onMapTap: () => _select(null),
                  ),
                ),
                Positioned(
                  right: RcbSpacing.xl,
                  bottom: RcbSpacing.xl,
                  child: _reportButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: RcbSpacing.sm,
          bottom: RcbSpacing.md,
        ),
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline,
          borderRadius: RcbRadii.pillBorder,
        ),
      ),
    );
  }
}

/// Short fade-and-rise when the panel swaps between list and detail.
class _FadeIn extends StatelessWidget {
  const _FadeIn({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: RcbMotion.medium,
      curve: RcbMotion.standard,
      child: child,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, (1 - t) * 12),
          child: child,
        ),
      ),
    );
  }
}
