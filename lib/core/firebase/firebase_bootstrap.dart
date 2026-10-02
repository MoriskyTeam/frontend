import 'package:dynamic_rcb_alerts/core/flavor/flavor_config.dart';
import 'package:dynamic_rcb_alerts/firebase_options_development.dart'
    as dev_options;
import 'package:dynamic_rcb_alerts/firebase_options_production.dart'
    as prod_options;
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Initialise Firebase for the active flavor before `runApp`.
///
/// App Check uses `debug` providers under `kDebugMode` and Play Integrity /
/// DeviceCheck in release. Crashlytics captures Flutter + platform errors.
/// Neither App Check nor Crashlytics is wired on web yet — App Check on web
/// needs a reCAPTCHA key, and Crashlytics has no web SDK.
Future<void> bootstrapFirebase(Flavor flavor) async {
  final options = switch (flavor) {
    Flavor.development => dev_options.DefaultFirebaseOptions.currentPlatform,
    Flavor.production => prod_options.DefaultFirebaseOptions.currentPlatform,
  };

  await Firebase.initializeApp(options: options);

  if (kIsWeb) return;

  await FirebaseAppCheck.instance.activate(
    androidProvider: kDebugMode
        ? AndroidProvider.debug
        : AndroidProvider.playIntegrity,
    appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.deviceCheck,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
