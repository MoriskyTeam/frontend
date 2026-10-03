import 'package:data/src/model/air_quality/gios_reading_dto.dart';
import 'package:data/src/model/air_quality/gios_station_dto.dart';

abstract class AirQualityService {
  Stream<List<GiosStationDTO>> watchStations();

  Stream<List<GiosReadingDTO>> watchReadings();
}
