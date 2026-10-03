import 'package:data/src/model/geocoding/address_dto.dart';

abstract class GeocodingService {
  /// Reverse-geocodes a coordinate; null when the place has no address.
  Future<AddressDTO?> reverse({required double lat, required double lng});
}
