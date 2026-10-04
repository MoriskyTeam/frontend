import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/routing/app_router.dart';

/// Opens the alarm screen for [DangerAlarm]s from every entry point (FCM
/// in the foreground, a tapped notification, the full-screen intent) and
/// keeps one source from opening it twice.
abstract final class DangerAlarmNavigator {
  static const path = '/alarm';

  static final _opened = <String>{};

  static void open(DangerAlarm alarm) {
    if (!_opened.add(alarm.sourceId)) return;
    appRouter.push(location(alarm).toString());
  }

  /// A test alarm always opens; it never reaches the server.
  static void openTest(DangerAlarm alarm) =>
      appRouter.push(location(alarm).toString());

  static Uri location(DangerAlarm alarm) => Uri(
    path: path,
    queryParameters: {
      for (final MapEntry(:key, :value) in alarm.toDTO().toJson().entries)
        if (value != null) key: '$value',
    },
  );

  static DangerAlarm? fromQuery(Map<String, String> query) =>
      DangerAlarmDTO.fromJson(query).toDomain();
}
