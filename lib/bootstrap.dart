import 'dart:async';
import 'dart:developer' as developer;

import 'package:data/data.dart';
import 'package:dynamic_rcb_alerts/app.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/firebase/firebase_bootstrap.dart';
import 'package:dynamic_rcb_alerts/core/flavor/flavor_config.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_notifications.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_sound.dart';
import 'package:dynamic_rcb_alerts/core/push/danger_alarm_navigator.dart';
import 'package:dynamic_rcb_alerts/core/supabase/supabase_bootstrap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Top-level FCM background handler. Runs in a separate isolate, so it
/// can't touch `getIt` or any other process-local state.
///
/// A danger alarm arrives data-only on Android; this raises the full-screen
/// alarm notification that wakes the phone. iOS shows the APNs alert itself.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  developer.log('Background FCM: ${message.messageId}', name: 'push');
  final alarm = DangerAlarmDTO.fromJson(message.data).toDomain();
  if (alarm == null) return;
  await AlarmNotifications.init();
  await AlarmNotifications.show(alarm);
}

/// Shared bootstrap entry — called by every flavor's `main_*.dart`.
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.init(flavor);
  // Barlow ships in assets/google_fonts — never fall back to the platform
  // sans on a first launch without network.
  GoogleFonts.config.allowRuntimeFetching = false;

  // Firebase carries push only (mobile); all app logic lives in Supabase.
  await bootstrapFirebase(flavor);
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await AlarmNotifications.init(onOpen: DangerAlarmNavigator.open);
    unawaited(AlarmSound.installForPush());
  }

  await bootstrapSupabase();
  await configureDependencies();

  runApp(const RcbAlertsApp());
}
