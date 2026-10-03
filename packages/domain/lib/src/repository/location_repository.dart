import 'package:domain/src/model/result/location/user_location.dart';

abstract class LocationRepository {
  Future<UserLocation> getCurrentLocation();
}
