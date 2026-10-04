import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// iOS plays a custom push sound only from the app bundle or
/// `Library/Sounds`; copying the asset there keeps the Xcode project
/// untouched. The `send-alarm` APNs payload names it `alarm.wav`.
abstract final class AlarmSound {
  static const asset = 'assets/sounds/alarm.wav';

  static Future<void> installForPush() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
    final library = await getLibraryDirectory();
    final target = File('${library.path}/Sounds/alarm.wav');
    if (target.existsSync()) return;
    final bytes = await rootBundle.load(asset);
    await target.create(recursive: true);
    await target.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
  }
}
