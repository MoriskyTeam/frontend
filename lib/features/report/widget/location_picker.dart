import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/neutral_tile_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Small map with a fixed centre pin; dragging the map moves the report.
class LocationPicker extends StatelessWidget {
  const LocationPicker({
    required this.initial,
    required this.onMoved,
    super.key,
  });

  final GeoPoint initial;
  final ValueChanged<GeoPoint> onMoved;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final scheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: RcbRadii.cardBorder,
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          borderRadius: RcbRadii.cardBorder,
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter: initial.latLng,
                  initialZoom: 16.5,
                  minZoom: 12,
                  maxZoom: 18,
                  backgroundColor: dark ? RcbColors.night : RcbColors.bone,
                  cameraConstraint: polandCameraConstraint,
                  interactionOptions: const InteractionOptions(
                    flags:
                        InteractiveFlag.drag |
                        InteractiveFlag.pinchZoom |
                        InteractiveFlag.doubleTapZoom |
                        InteractiveFlag.scrollWheelZoom,
                  ),
                  onPositionChanged: (camera, hasGesture) {
                    if (!hasGesture) return;
                    final LatLng(:latitude, :longitude) = camera.center;
                    onMoved(GeoPoint(latitude: latitude, longitude: longitude));
                  },
                ),
                children: const [NeutralTileLayer()],
              ),
              const IgnorePointer(child: Center(child: _Pin())),
            ],
          ),
        ),
      ),
    );
  }
}

class _Pin extends StatelessWidget {
  const _Pin();

  @override
  Widget build(BuildContext context) {
    // Lifted so the pin's tip, not its head, marks the centre.
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: RcbColors.patrolBlue,
              borderRadius: RcbRadii.tightBorder,
              border: Border.all(color: RcbColors.asphalt, width: 1.5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x4016181B),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: const Icon(
              Icons.people_alt_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
          Container(width: 2, height: 12, color: RcbColors.asphalt),
        ],
      ),
    );
  }
}
