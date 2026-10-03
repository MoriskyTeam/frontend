import 'package:data/src/model/location/location_dto.dart';
import 'package:domain/domain.dart';

extension LocationDTOMapper on LocationDTO {
  UserLocation toDomain() => UserLocation(
    point: GeoPoint(latitude: lat!, longitude: lng!),
    isFallback: isFallback ?? true,
  );
}
