import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const _distance = Distance();

extension MapCameraMeters on MapCamera {
  /// Screen length of [meters] measured eastwards from [point], so ground
  /// distances keep their size at every latitude and zoom.
  double metersToPixels(LatLng point, double meters) {
    final east = _distance.offset(point, meters, 90);
    return (getOffsetFromOrigin(east) - getOffsetFromOrigin(point)).distance;
  }
}
