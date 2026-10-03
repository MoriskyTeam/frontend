import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/supabase/supabase_bootstrap.dart';
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
import 'package:flutter_hooks/flutter_hooks.dart';
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

/// Controllers the map screen keeps across rebuilds, owned by hooks.
class _MapHandles {
  const _MapHandles({
    required this.mapController,
    required this.sheetController,
    required this.sheetExtent,
    required this.reveal,
    required this.topChromeKey,
  });

  final MapController mapController;
  final DraggableScrollableController sheetController;
  final ValueNotifier<double> sheetExtent;
  final ValueNotifier<Incident?> reveal;
  final GlobalKey topChromeKey;

  /// Height of the status card + chips overlay, so the camera keeps targets
  /// out from under it.
  double topChromeHeight() {
    final box = topChromeKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return 0;
    return box.localToGlobal(Offset.zero).dy + box.size.height;
  }
}

class _MapPageCore extends HookWidget {
  const _MapPageCore();

  static const _wideBreakpoint = 840.0;
  static const _sheetPeek = 0.34;
  static const _sheetMin = 0.16;
  static const _sheetDetail = 0.58;
  static const _sheetMax = 0.92;

  void _select(BuildContext context, Incident? incident) =>
      context.read<MapCubit>().select(incident?.id);

  void _syncSheet(_MapHandles handles, MapState state) {
    final sheet = handles.sheetController;
    if (!sheet.isAttached) return;
    final target = state.selectedIncidentId == null ? _sheetPeek : _sheetDetail;
    unawaited(
      sheet.animateTo(
        target,
        duration: RcbMotion.medium,
        curve: RcbMotion.standard,
      ),
    );
  }

  Future<void> _openReport(BuildContext context) async {
    unawaited(HapticFeedback.mediumImpact());
    final cubit = context.read<MapCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final incident = await context.push<Incident>('/report');
    if (incident == null || !context.mounted) return;
    cubit
      ..focusOwnReport(incident)
      ..select(incident.id);
    messenger.showSnackBar(_snackBar(context, Text(l10n.reportSent)));
  }

  void _onEvent(BuildContext context, _MapHandles handles, MapEvent event) {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    switch (event) {
      case IncidentArrived(:final incident):
        unawaited(HapticFeedback.lightImpact());
        handles.reveal.value = incident;
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
                onPressed: () => _select(context, incident),
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
      // Live arrivals must not pile up over the sheet: dismiss on their own
      // even when they carry an action.
      persist: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final handles = _MapHandles(
      mapController: useMemoized(MapController.new),
      sheetController: useDraggableScrollableController(),
      sheetExtent: useValueNotifier(_sheetPeek),
      reveal: useValueNotifier<Incident?>(null),
      topChromeKey: useMemoized(GlobalKey.new),
    );

    return BlocPresentationListener<MapCubit, MapEvent>(
      listener: (context, event) => _onEvent(context, handles, event),
      child: BlocConsumer<MapCubit, MapState>(
        listenWhen: (previous, current) =>
            previous.selectedIncidentId != current.selectedIncidentId,
        listener: (_, state) => _syncSheet(handles, state),
        builder: (context, state) {
          final data = MapViewData.from(state);
          return LayoutBuilder(
            builder: (context, constraints) =>
                constraints.maxWidth >= _wideBreakpoint
                ? _buildWide(context, handles, state, data)
                : _buildCompact(context, handles, state, data, constraints),
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
              onClose: () => _select(context, null),
              onConfirm: () => cubit.confirm(selected.id),
              scrollController: scrollController,
              header: header,
            )
          : NearbyPanel(
              data: data,
              now: now,
              arrivedIds: state.arrivedIds,
              allLayersOff: state.enabledLayers.isEmpty,
              loadFailed: state.loadingStatus.isError,
              showDemoNote: !SupabaseConfig.isConfigured,
              onRetry: cubit.retry,
              onSelect: (incident) => _select(context, incident),
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
      onPressed: () => _openReport(context),
      icon: const Icon(Icons.add_a_photo_outlined),
      label: Text(l10n.reportAction.toUpperCase()),
    );
  }

  Widget _buildCompact(
    BuildContext context,
    _MapHandles handles,
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
              controller: handles.mapController,
              incidents: data.visible,
              selected: data.selected,
              arrivedIds: state.arrivedIds,
              userLocation: state.userLocation,
              focusInset: () =>
                  height *
                  (state.selectedIncidentId != null
                      ? _sheetDetail
                      : handles.sheetExtent.value),
              topInset: handles.topChromeHeight,
              reveal: handles.reveal,
              onIncidentTap: (incident) => _select(context, incident),
              onMapTap: () => _select(context, null),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              key: handles.topChromeKey,
              mainAxisSize: MainAxisSize.min,
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
                    showDemoBadge: !SupabaseConfig.isConfigured,
                    offline: state.loadingStatus.isError,
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
              handles.sheetExtent.value = notification.extent;
              return false;
            },
            child: DraggableScrollableSheet(
              controller: handles.sheetController,
              initialChildSize: _sheetPeek,
              minChildSize: _sheetMin,
              maxChildSize: _sheetMax,
              snap: true,
              snapSizes: const [_sheetPeek, _sheetDetail],
              builder: (context, scrollController) => DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surface,
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
            valueListenable: handles.sheetExtent,
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
    _MapHandles handles,
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
                color: scheme.surface,
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
                        showDemoBadge: !SupabaseConfig.isConfigured,
                        offline: state.loadingStatus.isError,
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
                    controller: handles.mapController,
                    incidents: data.visible,
                    selected: data.selected,
                    arrivedIds: state.arrivedIds,
                    userLocation: state.userLocation,
                    focusInset: () => 0,
                    topInset: () => 0,
                    reveal: handles.reveal,
                    onIncidentTap: (incident) => _select(context, incident),
                    onMapTap: () => _select(context, null),
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
