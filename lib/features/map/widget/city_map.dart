import 'dart:ui' show lerpDouble;

import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/incident_marker.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/user_location_marker.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/neutral_tile_layer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Rynek Główny — the camera's starting point before a position arrives.
const krakowCentre = LatLng(50.0617, 19.9373);

/// The live city map: neutral OSM basemap, warning areas, markers.
///
/// Moves the camera to [selected] whenever it changes, keeping it clear of
/// whatever overlays the bottom [focusInset] of the map.
class CityMap extends HookWidget {
  const CityMap({
    required this.incidents,
    required this.selected,
    required this.arrivedIds,
    required this.userLocation,
    required this.focusInset,
    required this.topInset,
    required this.reveal,
    required this.onIncidentTap,
    required this.onMapTap,
    required this.controller,
    super.key,
  });

  final List<Incident> incidents;
  final Incident? selected;
  final Set<String> arrivedIds;
  final UserLocation? userLocation;

  /// Screen space at the bottom covered by the sheet (or zero on wide
  /// layouts), read when the camera moves.
  final double Function() focusInset;

  /// Screen space at the top covered by the status card and chips.
  final double Function() topInset;

  /// Live arrivals to bring into view without selecting them.
  final ValueListenable<Incident?> reveal;
  final ValueChanged<Incident> onIncidentTap;
  final VoidCallback onMapTap;
  final MapController controller;

  static const _initialZoom = 13.4;
  static const _focusZoom = 15.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    // Camera callbacks fire after this build (post-frame, onMapReady, live
    // reveals), so they read the latest props instead of a captured build.
    final latest = useRef(this)..value = this;
    final mapReady = useRef(false);
    final flight = useRef<_Flight?>(null);
    final camera = useAnimationController(duration: RcbMotion.camera);

    useOnListenableChange(camera, () {
      final current = flight.value;
      if (current == null) return;
      current.apply(
        latest.value.controller,
        Curves.easeInOutCubic.transform(camera.value),
      );
    });

    void flyTo(LatLng target, double zoom) {
      // A shared link can select before the map has laid out; onMapReady
      // replays the focus then.
      if (!mapReady.value) return;
      final map = latest.value;
      // Centre the target in the band between the top chrome and the sheet.
      final offset = Offset(0, (map.topInset() - map.focusInset()) / 2);
      if (reduceMotion) {
        map.controller.move(target, zoom, offset: offset);
        return;
      }
      final from = map.controller.camera;
      flight.value = _Flight(
        fromCenter: from.center,
        toCenter: target,
        fromZoom: from.zoom,
        toZoom: zoom,
        offset: offset,
      );
      camera.forward(from: 0);
    }

    void focusSelected() {
      final selected = latest.value.selected;
      if (selected == null) return;
      final zoom = selected.areaRadiusMeters != null ? 12.0 : _focusZoom;
      flyTo(selected.location.latLng, zoom);
    }

    /// Pans (without zooming) so a live arrival lands in the clear band
    /// between the top chrome and the sheet — the odblask sweep must play
    /// where the resident can see it.
    void revealArrival() {
      final map = latest.value;
      final incident = map.reveal.value;
      if (incident == null || !mapReady.value || map.selected != null) return;
      final view = map.controller.camera;
      final point = view.latLngToScreenOffset(incident.location.latLng);
      final top = map.topInset();
      final bottom = view.size.height - map.focusInset();
      const margin = incidentMarkerExtent;
      final visible =
          point.dx >= margin &&
          point.dx <= view.size.width - margin &&
          point.dy >= top + margin &&
          point.dy <= bottom - margin;
      if (!visible) flyTo(incident.location.latLng, view.zoom);
    }

    useOnListenableChange(reveal, revealArrival);

    useEffect(() {
      if (selected != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => focusSelected());
      }
      return null;
    }, [selected?.id]);

    useEffect(() {
      final location = userLocation;
      if (location != null && selected == null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => flyTo(location.point.latLng, 14),
        );
      }
      return null;
    }, [userLocation != null]);

    final selectedId = selected?.id;
    final warnings = incidents.where(
      (incident) =>
          incident.areaRadiusMeters != null &&
          incident.status != IncidentStatus.resolved,
    );
    // Draw low severity first so serious incidents sit on top.
    final ordered = [...incidents]
      ..sort((a, b) {
        if (a.id == selectedId) return 1;
        if (b.id == selectedId) return -1;
        return a.severity.index.compareTo(b.severity.index);
      });

    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: krakowCentre,
        initialZoom: _initialZoom,
        minZoom: 10,
        maxZoom: 18,
        backgroundColor: dark ? RcbColors.night : RcbColors.bone,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (_, _) => onMapTap(),
        onMapReady: () {
          mapReady.value = true;
          focusSelected();
        },
      ),
      children: [
        const NeutralTileLayer(),
        CircleLayer(
          circles: [
            for (final warning in warnings)
              CircleMarker(
                point: warning.location.latLng,
                radius: warning.areaRadiusMeters!.toDouble(),
                useRadiusInMeter: true,
                // A city-wide area must not tint the whole basemap; it is
                // filled only while the resident is reading it.
                color: warning.id == selectedId
                    ? RcbColors.signalRed.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderColor: RcbColors.signalRed.withValues(alpha: 0.55),
                borderStrokeWidth: 1.5,
              ),
            if (userLocation case final location?)
              CircleMarker(
                point: location.point.latLng,
                radius: nearbyRadiusMeters.toDouble(),
                useRadiusInMeter: true,
                color: Colors.transparent,
                borderColor: (dark ? RcbColors.nightInk : RcbColors.asphalt)
                    .withValues(alpha: 0.35),
                borderStrokeWidth: 1,
              ),
          ],
        ),
        MarkerLayer(
          markers: [
            for (final incident in ordered)
              Marker(
                key: ValueKey(incident.id),
                point: incident.location.latLng,
                width: incidentMarkerExtent,
                height: incidentMarkerExtent,
                child: IncidentMarker(
                  incident: incident,
                  selected: incident.id == selectedId,
                  dimmed: selectedId != null && incident.id != selectedId,
                  arrived: arrivedIds.contains(incident.id),
                  semanticLabel:
                      '${l10n.titleOf(incident)}, '
                      '${l10n.severity(incident.severity)}, '
                      '${l10n.source(incident.source)}',
                  onTap: () => onIncidentTap(incident),
                ),
              ),
            if (userLocation case final location?)
              Marker(
                point: location.point.latLng,
                width: 28,
                height: 28,
                child: UserLocationMarker(label: l10n.myLocation),
              ),
          ],
        ),
      ],
    );
  }
}

/// One camera move, interpolated by the shared camera controller.
class _Flight {
  const _Flight({
    required this.fromCenter,
    required this.toCenter,
    required this.fromZoom,
    required this.toZoom,
    required this.offset,
  });

  final LatLng fromCenter;
  final LatLng toCenter;
  final double fromZoom;
  final double toZoom;
  final Offset offset;

  void apply(MapController controller, double t) {
    controller.move(
      LatLng(
        lerpDouble(fromCenter.latitude, toCenter.latitude, t)!,
        lerpDouble(fromCenter.longitude, toCenter.longitude, t)!,
      ),
      lerpDouble(fromZoom, toZoom, t)!,
      offset: Offset.lerp(Offset.zero, offset, t)!,
    );
  }
}
