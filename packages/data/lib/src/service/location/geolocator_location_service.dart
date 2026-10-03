import 'package:data/src/model/location/location_dto.dart';
import 'package:data/src/service/location/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

/// Device position via `geolocator`, with a Kraków demo anchor.
///
/// The live feed only covers Kraków, so a position outside the city (or no
/// position at all: permission denied, desktop browser, emulator) falls back
/// to Rynek Główny and is flagged so the UI can say so.
@Injectable(as: LocationService)
class GeolocatorLocationService implements LocationService {
  static const _fallbackLat = 50.0617;
  static const _fallbackLng = 19.9373;

  // Rough Kraków bounding box.
  static const _minLat = 49.96;
  static const _maxLat = 50.13;
  static const _minLng = 19.79;
  static const _maxLng = 20.22;

  static const _fallback = LocationDTO(
    lat: _fallbackLat,
    lng: _fallbackLng,
    isFallback: true,
  );

  @override
  Future<LocationDTO> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) return _fallback;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return _fallback;
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 8),
      ),
    );

    final insideCity =
        position.latitude >= _minLat &&
        position.latitude <= _maxLat &&
        position.longitude >= _minLng &&
        position.longitude <= _maxLng;
    if (!insideCity) return _fallback;

    return LocationDTO(
      lat: position.latitude,
      lng: position.longitude,
      isFallback: false,
    );
  }
}
