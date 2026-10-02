import 'dart:developer' as developer;

import 'package:dynamic_rcb_alerts/app.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/firebase/firebase_bootstrap.dart';
import 'package:dynamic_rcb_alerts/core/flavor/flavor_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Top-level FCM background handler. Runs in a separate isolate, so it
/// can't touch `getIt` or any other process-local state.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  developer.log(
    'Background FCM: ${message.messageId}',
    name: 'push',
  );
}

/// Shared bootstrap entry — called by every flavor's `main_*.dart`.
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.init(flavor);

  await bootstrapFirebase(flavor);
  // Web delivers background messages through the service worker instead.
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  await configureDependencies();

  runApp(const RcbAlertsApp());
}
