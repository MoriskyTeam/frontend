import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test(
    'GIVEN a station that measures PM2.5,\n'
    'WHEN reading its headline value,\n'
    'THEN PM2.5 is shown',
    () {
      // GIVEN
      const reading = AirReading(
        level: AirQualityLevel.moderate,
        pm25: 40,
        pm10: 60,
      );

      // THEN
      expect(reading.headline, 40);
      expect(reading.headlineIsPm10, isFalse);
    },
  );

  test(
    'GIVEN a station without PM2.5,\n'
    'WHEN reading its headline value,\n'
    'THEN PM10 is shown instead',
    () {
      // GIVEN
      const reading = AirReading(
        level: AirQualityLevel.good,
        pm25: null,
        pm10: 25,
      );

      // THEN
      expect(reading.headline, 25);
      expect(reading.headlineIsPm10, isTrue);
    },
  );
}
