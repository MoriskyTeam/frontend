import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  group('AirQualityLevel.fromReadings', () {
    test(
      'GIVEN readings in different bands,\n'
      'WHEN deriving the index,\n'
      'THEN the worst sub-index wins',
      () {
        expect(
          AirQualityLevel.fromReadings(pm25: 16, pm10: 88),
          AirQualityLevel.sufficient,
        );
      },
    );

    test('maps GIOŚ band edges', () {
      expect(AirQualityLevel.fromReadings(pm25: 13), AirQualityLevel.veryGood);
      expect(AirQualityLevel.fromReadings(pm25: 31), AirQualityLevel.good);
      expect(AirQualityLevel.fromReadings(pm25: 48), AirQualityLevel.moderate);
      expect(AirQualityLevel.fromReadings(pm10: 118), AirQualityLevel.bad);
      expect(AirQualityLevel.fromReadings(pm25: 111), AirQualityLevel.veryBad);
    });

    test('returns null without readings', () {
      expect(AirQualityLevel.fromReadings(), isNull);
    });
  });
}
