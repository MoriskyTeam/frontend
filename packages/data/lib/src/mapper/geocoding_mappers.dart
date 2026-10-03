import 'package:data/src/model/geocoding/address_dto.dart';

extension AddressDTOMapper on AddressDTO {
  /// "Grodzka 5, Stare Miasto" — street first, then the most local area
  /// name; null when Nominatim knows neither.
  String? toDomain() {
    final street = road ?? pedestrian;
    final line = [
      if (street != null) houseNumber == null ? street : '$street $houseNumber',
      ?(neighbourhood ?? quarter ?? suburb ?? cityDistrict),
    ];
    return line.isEmpty ? null : line.join(', ');
  }
}
