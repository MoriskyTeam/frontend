import 'package:data/src/service/push/push_device_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Device registration through the `register_push_device` RPC; the table
/// itself is not writable by residents. Schema:
/// `docs/push_alarm_backend.md`.
@LazySingleton(as: PushDeviceService)
class SupabasePushDeviceService implements PushDeviceService {
  SupabasePushDeviceService(this._client);

  final SupabaseClient _client;

  @override
  Future<void> registerDevice({
    required String token,
    required String platform,
    required double? lat,
    required double? lng,
    required bool alarmsEnabled,
    required String? locale,
  }) => _client.rpc<void>(
    'register_push_device',
    params: {
      'p_token': token,
      'p_platform': platform,
      'p_lat': lat,
      'p_lng': lng,
      'p_alarms_enabled': alarmsEnabled,
      'p_locale': locale,
    },
  );
}
