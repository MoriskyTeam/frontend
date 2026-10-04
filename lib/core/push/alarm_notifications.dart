import 'dart:convert';
import 'dart:ui';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// The Android danger alarm notification: max importance, alarm audio
/// stream (rings on silent), insistent sound and a full-screen intent that
/// turns the screen on and opens the alarm page over the lock screen.
///
/// Static so the FCM background isolate can use it without DI.
abstract final class AlarmNotifications {
  static const _channelId = 'danger_alarm_v1';
  static const _notificationId = 112;

  /// `Notification.FLAG_INSISTENT`: repeat the sound until handled.
  static const _flagInsistent = 4;

  static final _plugin = FlutterLocalNotificationsPlugin();

  static AndroidFlutterLocalNotificationsPlugin? get _android => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  static bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  /// [onOpen] fires when the resident taps the notification or the
  /// full-screen intent brings the app forward.
  static Future<void> init({ValueChanged<DangerAlarm>? onOpen}) async {
    if (!_isAndroid) return;
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: (response) {
        final alarm = decode(response.payload);
        if (alarm != null) onOpen?.call(alarm);
      },
    );
    final l10n = _l10n();
    await _android?.createNotificationChannel(
      AndroidNotificationChannel(
        _channelId,
        l10n.alarmChannelName,
        description: l10n.alarmChannelDescription,
        importance: Importance.max,
        sound: const RawResourceAndroidNotificationSound('alarm'),
        audioAttributesUsage: AudioAttributesUsage.alarm,
        vibrationPattern: _vibration,
        enableLights: true,
        ledColor: RcbColors.signalRed,
        // Takes effect only once the resident grants DND access.
        bypassDnd: true,
      ),
    );
  }

  static Future<void> show(DangerAlarm alarm) async {
    if (!_isAndroid) return;
    final l10n = _l10n();
    await _plugin.show(
      id: _notificationId,
      title: alarm.title.isEmpty ? l10n.alarmHeadline : alarm.title,
      body: alarm.body,
      payload: encode(alarm),
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          l10n.alarmChannelName,
          channelDescription: l10n.alarmChannelDescription,
          importance: Importance.max,
          priority: Priority.max,
          category: AndroidNotificationCategory.alarm,
          fullScreenIntent: true,
          visibility: NotificationVisibility.public,
          sound: const RawResourceAndroidNotificationSound('alarm'),
          audioAttributesUsage: AudioAttributesUsage.alarm,
          vibrationPattern: _vibration,
          color: RcbColors.signalRed,
          ongoing: true,
          autoCancel: false,
          additionalFlags: Int32List.fromList([_flagInsistent]),
        ),
      ),
    );
  }

  /// The alarm whose notification (or full-screen intent) launched the app.
  static Future<DangerAlarm?> launchAlarm() async {
    if (!_isAndroid) return null;
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (!(details?.didNotificationLaunchApp ?? false)) return null;
    return decode(details?.notificationResponse?.payload);
  }

  /// Silences the insistent notification once the alarm page took over.
  static Future<void> cancel() async {
    if (!_isAndroid) return;
    await _plugin.cancel(id: _notificationId);
  }

  /// Native side in `MainActivity.kt`; the plugin can request but not
  /// report the permission, and its request silently does nothing when the
  /// permission is already there.
  static const _channel = MethodChannel('cityshield/alarm');

  /// Whether a locked phone can be woken full-screen. Android 14+ makes
  /// this opt-in; earlier versions always allow it.
  static Future<bool> canUseFullScreen() async {
    if (!_isAndroid) return true;
    return await _channel.invokeMethod<bool>('canUseFullScreenIntent') ?? true;
  }

  /// The system toggle on Android 14+, notification settings before that.
  static Future<void> openFullScreenSettings() async {
    if (!_isAndroid) return;
    await _channel.invokeMethod<void>('openFullScreenIntentSettings');
  }

  static String encode(DangerAlarm alarm) => jsonEncode(alarm.toDTO().toJson());

  static DangerAlarm? decode(String? payload) {
    if (payload == null || payload.isEmpty) return null;
    final json = jsonDecode(payload);
    return json is Map<String, dynamic>
        ? DangerAlarmDTO.fromJson(json).toDomain()
        : null;
  }

  static final _vibration = Int64List.fromList([0, 800, 400, 800, 400, 800]);

  /// The background isolate has no widget tree; resolve strings from the
  /// device locale, Polish when it is not supported.
  static AppLocalizations _l10n() {
    final locale = PlatformDispatcher.instance.locale;
    final supported = AppLocalizations.supportedLocales.any(
      (candidate) => candidate.languageCode == locale.languageCode,
    );
    return lookupAppLocalizations(
      supported ? Locale(locale.languageCode) : const Locale('pl'),
    );
  }
}
