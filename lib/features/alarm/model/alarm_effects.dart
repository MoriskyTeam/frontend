import 'dart:async';
import 'dart:developer' as developer;

import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_notifications.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_sound.dart';
import 'package:injectable/injectable.dart';
import 'package:torch_light/torch_light.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Everything the alarm does to the phone: siren on the alarm audio stream,
/// vibration, torch strobe and keeping the screen on.
///
/// Each effect fails on its own (no torch, no vibrator, a busy audio
/// focus) without taking the others down.
@injectable
class AlarmEffects {
  /// One torch toggle per period: 1.25 flashes a second, well under the
  /// 3 Hz photosensitivity threshold (WCAG 2.3.1).
  static const strobePeriod = Duration(milliseconds: 400);

  final _player = AudioPlayer();
  Timer? _strobe;
  bool _torchOn = false;
  bool _running = false;

  Future<void> start({required bool strobe}) async {
    if (_running) return;
    _running = true;
    // The page has taken over; the insistent notification sound would
    // otherwise play over the siren.
    await _guard('notification', AlarmNotifications.cancel);
    await Future.wait([
      _guard('wakelock', WakelockPlus.enable),
      _guard('siren', _startSiren),
      _guard('vibration', _startVibration),
      _guard('torch', () => _startTorch(strobe: strobe)),
    ]);
  }

  Future<void> stop() async {
    if (!_running) return;
    _running = false;
    _strobe?.cancel();
    _strobe = null;
    await Future.wait([
      _guard('siren', _player.stop),
      _guard('vibration', Vibration.cancel),
      _guard('torch', () async {
        if (_torchOn) await TorchLight.disableTorch();
        _torchOn = false;
      }),
      _guard('wakelock', WakelockPlus.disable),
    ]);
  }

  /// Stops everything and releases the player; the effects are done.
  Future<void> dispose() async {
    await stop();
    await _player.dispose();
  }

  Future<void> _startSiren() async {
    await _player.setAudioContext(
      AudioContext(
        android: const AudioContextAndroid(
          usageType: AndroidUsageType.alarm,
          contentType: AndroidContentType.sonification,
          audioFocus: AndroidAudioFocus.gainTransient,
          stayAwake: true,
        ),
        // Playback ignores the ring/silent switch.
        iOS: AudioContextIOS(),
      ),
    );
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(
      AssetSource(AlarmSound.asset.replaceFirst('assets/', '')),
      volume: 1,
    );
  }

  Future<void> _startVibration() async {
    if (!await Vibration.hasVibrator()) return;
    await Vibration.vibrate(pattern: [0, 800, 400, 800], repeat: 0);
  }

  Future<void> _startTorch({required bool strobe}) async {
    if (!await TorchLight.isTorchAvailable()) return;
    if (!strobe) {
      await TorchLight.enableTorch();
      _torchOn = true;
      return;
    }
    _strobe = Timer.periodic(strobePeriod, (_) async {
      if (!_running) return;
      await _guard('torch', () async {
        _torchOn
            ? await TorchLight.disableTorch()
            : await TorchLight.enableTorch();
        _torchOn = !_torchOn;
      });
    });
  }

  static Future<void> _guard(
    String effect,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } on Object catch (error) {
      developer.log('$effect unavailable: $error', name: 'alarm');
    }
  }
}
