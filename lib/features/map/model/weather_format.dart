import 'package:domain/domain.dart';
import 'package:intl/intl.dart';

/// Locale-aware figures for a [WeatherReading]: "9,9" in Polish, "9.9" in
/// English, a dash when the station sent nothing.
extension WeatherReadingFormat on WeatherReading {
  static String _one(double? value, String locale) =>
      value == null ? '–' : NumberFormat('0.#', locale).format(value);

  static String _whole(double? value, String locale) =>
      value == null ? '–' : NumberFormat('0', locale).format(value);

  /// "9,9 °C".
  String temperatureLabel(String locale) => '${_one(temperature, locale)} °C';

  /// "10°", short enough for a map marker.
  String get temperatureShort =>
      temperature == null ? '–' : '${temperature!.round()}°';

  String windSpeedLabel(String locale) => '${_one(windSpeed, locale)} m/s';

  String humidityLabel(String locale) => '${_whole(humidity, locale)}%';

  String precipitationLabel(String locale) =>
      '${_one(precipitation, locale)} mm';

  String pressureValue(String locale) => _one(pressure, locale);

  /// Below this the direction is noise; IMGW reports calm as 0 m/s, 0°.
  bool get isCalm => (windSpeed ?? 0) < 0.5;
}
