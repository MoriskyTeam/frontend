import 'package:dynamic_rcb_alerts/core/flavor/flavor_config.dart';
import 'package:dynamic_rcb_alerts/firebase_options_development.dart'
    as dev_options;
import 'package:dynamic_rcb_alerts/firebase_options_production.dart'
    as prod_options;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Initialise Firebase for the active flavor before `runApp`.
///
/// Firebase only carries push (FCM) on mobile; app logic lives in Supabase
/// and the web build is merely hosted on Firebase Hosting, so web skips it.
Future<void> bootstrapFirebase(Flavor flavor) async {
  if (kIsWeb) return;

  final options = switch (flavor) {
    Flavor.development => dev_options.DefaultFirebaseOptions.currentPlatform,
    Flavor.production => prod_options.DefaultFirebaseOptions.currentPlatform,
  };

  await Firebase.initializeApp(options: options);
}
