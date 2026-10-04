import 'package:domain/src/model/result/alarm/danger_alarm.dart';
import 'package:domain/src/model/result/location/geo_point.dart';

abstract class AlarmRepository {
  /// Asks for notification permission (once, the system remembers) and
  /// tells the server this device's push token and last known [location],
  /// so alarms reach it. A null [location] keeps the last one on file.
  Future<void> registerDevice({required GeoPoint? location});

  Future<bool> areAlarmsEnabled();

  Future<void> setAlarmsEnabled({required bool enabled});

  /// Alarms that arrive while the app is open, or that the resident opened
  /// from a system notification.
  Stream<DangerAlarm> watchAlarms();

  /// The alarm whose notification launched the app, if any.
  Future<DangerAlarm?> getLaunchAlarm();
}
