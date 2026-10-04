abstract class PushDeviceService {
  /// Upserts this device in `push_devices` via `register_push_device`.
  Future<void> registerDevice({
    required String token,
    required String platform,
    required double? lat,
    required double? lng,
    required bool alarmsEnabled,
    required String? locale,
  });
}
