import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/mapper/radar_mappers.dart';
import 'package:data/src/service/radar/radar_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RadarRepository)
class RadarRepositoryImpl extends RadarRepository {
  RadarRepositoryImpl(this._service);

  final RadarService _service;

  @override
  Future<RadarFrame?> getLatestFrame() async {
    try {
      final dto = await _service.getWeatherMaps();
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }
}
