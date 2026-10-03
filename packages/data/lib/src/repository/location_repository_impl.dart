import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/mapper/location_mappers.dart';
import 'package:data/src/service/location/location_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(this._service);

  final LocationService _service;

  @override
  Future<UserLocation> getCurrentLocation() async {
    try {
      final dto = await _service.getCurrentLocation();
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }
}
