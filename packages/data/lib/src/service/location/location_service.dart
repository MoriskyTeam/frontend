import 'package:data/src/model/location/location_dto.dart';

abstract class LocationService {
  Future<LocationDTO> getCurrentLocation();
}
