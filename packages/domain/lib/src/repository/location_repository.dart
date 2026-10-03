import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:domain/src/model/result/location/user_location.dart';

abstract class LocationRepository {
  Future<UserLocation> getCurrentLocation();

  /// Short street address for [point] ("Grodzka 5, Stare Miasto"), or null
  /// when nothing sensible is known there.
  Future<String?> getAddress({required GeoPoint point});
}
