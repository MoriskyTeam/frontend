import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  test(
    'GIVEN a RainViewer weather-maps index,\n'
    'WHEN decoded and mapped,\n'
    'THEN the newest past frame becomes the tile template',
    () {
      final frame = WeatherMapsDTO.fromJson(const {
        'version': '2.0',
        'host': 'https://tilecache.rainviewer.com',
        'radar': {
          'past': [
            {'time': 1791059400, 'path': '/v2/radar/newest'},
            {'time': 1791052200, 'path': '/v2/radar/oldest'},
            {'time': 1791055800, 'path': null},
          ],
          'nowcast': <Object>[],
        },
      }).toDomain();

      expect(
        frame?.tileUrlTemplate,
        'https://tilecache.rainviewer.com/v2/radar/newest'
        '/256/{z}/{x}/{y}/2/1_1.png',
      );
      expect(
        frame?.time,
        DateTime.fromMillisecondsSinceEpoch(1791059400 * 1000),
      );
      expect(frame?.maxNativeZoom, 7);
    },
  );

  test(
    'GIVEN an index without radar frames,\n'
    'WHEN mapped,\n'
    'THEN there is no frame',
    () {
      expect(
        WeatherMapsDTO.fromJson(const {
          'host': 'https://tilecache.rainviewer.com',
          'radar': {'past': <Object>[]},
        }).toDomain(),
        isNull,
      );
      expect(
        WeatherMapsDTO.fromJson(const {'host': null, 'radar': null}).toDomain(),
        isNull,
      );
    },
  );
}
