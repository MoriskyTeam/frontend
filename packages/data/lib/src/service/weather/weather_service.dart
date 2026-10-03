import 'package:data/src/model/weather/synop_reading_dto.dart';
import 'package:data/src/model/weather/synop_station_dto.dart';

abstract class WeatherService {
  Stream<List<SynopStationDTO>> watchStations();

  Stream<List<SynopReadingDTO>> watchReadings();
}
