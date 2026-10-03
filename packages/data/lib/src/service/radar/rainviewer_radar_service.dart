import 'dart:convert';

import 'package:data/src/model/radar/weather_maps_dto.dart';
import 'package:data/src/service/radar/radar_service.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

/// RainViewer public API — no key, frames refresh every 10 minutes.
@Injectable(as: RadarService)
class RainViewerRadarService implements RadarService {
  static final _index = Uri.https(
    'api.rainviewer.com',
    '/public/weather-maps.json',
  );
  static const _timeout = Duration(seconds: 6);

  @override
  Future<WeatherMapsDTO> getWeatherMaps() async {
    final response = await http.get(_index).timeout(_timeout);
    if (response.statusCode != 200) {
      throw http.ClientException(
        'RainViewer ${response.statusCode}',
        _index,
      );
    }
    return WeatherMapsDTO.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
