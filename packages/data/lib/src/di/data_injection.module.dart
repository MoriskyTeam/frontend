//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:cloud_functions/cloud_functions.dart' as _i809;
import 'package:data/src/client/firebase_client.dart' as _i1049;
import 'package:data/src/local_storage/preferences_module.dart' as _i467;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final preferencesModule = _$PreferencesModule();
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => preferencesModule.preferences,
    );
    gh.lazySingleton<_i1049.FirebaseClient>(
      () => _i1049.FirebaseClient(
        auth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
        functions: gh<_i809.FirebaseFunctions>(),
        storage: gh<_i457.FirebaseStorage>(),
        remoteConfig: gh<_i627.FirebaseRemoteConfig>(),
      ),
    );
  }
}

class _$PreferencesModule extends _i467.PreferencesModule {}
