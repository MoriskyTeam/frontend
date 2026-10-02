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
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Rynek Główny — the camera's starting point before a position arrives.
const krakowCentre = LatLng(50.0617, 19.9373);

/// The live city map: neutral CARTO basemap, warning areas, markers.
///
/// Moves the camera to [selected] whenever it changes, keeping it clear of
/// whatever overlays the bottom [focusInset] of the map.
class CityMap extends StatefulWidget {
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

  @override
  State<CityMap> createState() => _CityMapState();
}

class _CityMapState extends State<CityMap> with TickerProviderStateMixin {
  static const _initialZoom = 13.4;
  static const _focusZoom = 15.0;

  AnimationController? _camera;
  bool _mapReady = false;

  @override
  void initState() {
    super.initState();
    widget.reveal.addListener(_onReveal);
  }

  /// Pans (without zooming) so a live arrival lands in the clear band
  /// between the top chrome and the sheet — the odblask sweep must play
  /// where the resident can see it.
  void _onReveal() {
    final incident = widget.reveal.value;
    if (incident == null || !_mapReady || widget.selected != null) return;
    final camera = widget.controller.camera;
    final point = camera.latLngToScreenOffset(incident.location.latLng);
    final top = widget.topInset();
    final bottom = camera.size.height - widget.focusInset();
    const margin = incidentMarkerExtent;
    final visible =
        point.dx >= margin &&
        point.dx <= camera.size.width - margin &&
        point.dy >= top + margin &&
        point.dy <= bottom - margin;
    if (!visible) _flyTo(incident.location.latLng, camera.zoom);
  }

  @override
  void didUpdateWidget(CityMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selected = widget.selected;
    if (selected != null && selected.id != oldWidget.selected?.id) {
      _focusSelected();
    }
    final location = widget.userLocation;
    if (location != null &&
        oldWidget.userLocation == null &&
        selected == null) {
      _flyTo(location.point.latLng, 14);
    }
  }

  void _focusSelected() {
    final selected = widget.selected;
    if (selected == null) return;
    final zoom = selected.areaRadiusMeters != null ? 12.0 : _focusZoom;
    _flyTo(selected.location.latLng, zoom);
  }

  void _flyTo(LatLng target, double zoom) {
    // A shared link can select before the map has laid out; onMapReady
    // replays the focus then.
    if (!_mapReady) return;
    _camera?.dispose();
    final camera = widget.controller.camera;
    // Centre the target in the band between the top chrome and the sheet.
    final offset = Offset(0, (widget.topInset() - widget.focusInset()) / 2);
    if (MediaQuery.disableAnimationsOf(context)) {
      widget.controller.move(target, zoom, offset: offset);
      return;
    }
    final latTween = Tween(
      begin: camera.center.latitude,
      end: target.latitude,
    );
    final lngTween = Tween(
      begin: camera.center.longitude,
      end: target.longitude,
    );
    final zoomTween = Tween(begin: camera.zoom, end: zoom);
    final offsetTween = Tween(begin: Offset.zero, end: offset);
    final controller = AnimationController(
      vsync: this,
      duration: RcbMotion.camera,
    );
    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubic,
    );
    controller.addListener(() {
      widget.controller.move(
        LatLng(latTween.evaluate(curve), lngTween.evaluate(curve)),
        zoomTween.evaluate(curve),
        offset: offsetTween.evaluate(curve),
      );
    });
    _camera = controller..forward();
  }

  @override
  void dispose() {
    widget.reveal.removeListener(_onReveal);
    _camera?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final selectedId = widget.selected?.id;
    final warnings = widget.incidents.where(
      (incident) =>
          incident.areaRadiusMeters != null &&
          incident.status != IncidentStatus.resolved,
    );
    // Draw low severity first so serious incidents sit on top.
    final ordered = [...widget.incidents]
      ..sort((a, b) {
        if (a.id == selectedId) return 1;
        if (b.id == selectedId) return -1;
        return a.severity.index.compareTo(b.severity.index);
      });

    return FlutterMap(
      mapController: widget.controller,
      options: MapOptions(
        initialCenter: krakowCentre,
        initialZoom: _initialZoom,
        minZoom: 10,
        maxZoom: 18,
        backgroundColor: dark ? RcbColors.night : RcbColors.bone,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (_, _) => widget.onMapTap(),
        onMapReady: () {
          _mapReady = true;
          _focusSelected();
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
            if (widget.userLocation case final location?)
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
                  arrived: widget.arrivedIds.contains(incident.id),
                  semanticLabel:
                      '${l10n.titleOf(incident)}, '
                      '${l10n.severity(incident.severity)}, '
                      '${l10n.source(incident.source)}',
                  onTap: () => widget.onIncidentTap(incident),
                ),
              ),
            if (widget.userLocation case final location?)
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
