import 'package:data/src/model/radar/weather_maps_dto.dart';

abstract class RadarService {
  /// The index of currently published radar frames.
  Future<WeatherMapsDTO> getWeatherMaps();
}
