import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/mapper/push_mappers.dart';
import 'package:data/src/service/push/push_device_service.dart';
import 'package:data/src/service/push/push_messaging_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Alarms are mobile only: on web every call is a no-op.
@Injectable(as: AlarmRepository)
class AlarmRepositoryImpl extends AlarmRepository {
  AlarmRepositoryImpl(this._messaging, this._devices, this._preferences);

  final PushMessagingService _messaging;
  final PushDeviceService _devices;
  final SharedPreferencesAsync _preferences;

  static const _enabledKey = 'danger_alarms_enabled';

  static bool get _supported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  Future<void> registerDevice({required GeoPoint? location}) async {
    if (!_supported) return;
    try {
      await _messaging.requestPermission();
      final token = await _messaging.getToken();
      if (token == null) return;
      await _devices.registerDevice(
        token: token,
        platform: defaultTargetPlatform == TargetPlatform.iOS
            ? 'ios'
            : 'android',
        // ~100 m is enough to pick who is in range, and no more precise
        // than that leaves the phone.
        lat: _round(location?.latitude),
        lng: _round(location?.longitude),
        alarmsEnabled: await areAlarmsEnabled(),
        locale: PlatformDispatcher.instance.locale.languageCode,
      );
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }

  @override
  Future<bool> areAlarmsEnabled() async =>
      await _preferences.getBool(_enabledKey) ?? true;

  @override
  Future<void> setAlarmsEnabled({required bool enabled}) async {
    await _preferences.setBool(_enabledKey, enabled);
    await registerDevice(location: null);
  }

  @override
  Stream<DangerAlarm> watchAlarms() {
    if (!_supported) return const Stream.empty();
    return MergeStream([
      _messaging.foregroundMessages(),
      _messaging.openedMessages(),
    ]).map((dto) => dto.toDomain()).whereNotNull();
  }

  @override
  Future<DangerAlarm?> getLaunchAlarm() async {
    if (!_supported) return null;
    return (await _messaging.initialMessage())?.toDomain();
  }

  static double? _round(double? value) =>
      value == null ? null : (value * 1000).roundToDouble() / 1000;
}
