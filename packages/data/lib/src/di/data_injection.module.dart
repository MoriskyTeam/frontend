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
import 'package:data/src/repository/incident_repository_impl.dart' as _i635;
import 'package:data/src/repository/location_repository_impl.dart' as _i27;
import 'package:data/src/service/incident/incident_service.dart' as _i912;
import 'package:data/src/service/incident/mock_incident_service.dart' as _i627;
import 'package:data/src/service/location/geolocator_location_service.dart'
    as _i744;
import 'package:data/src/service/location/location_service.dart' as _i554;
import 'package:domain/domain.dart' as _i494;
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
    gh.factory<_i554.LocationService>(() => _i744.GeolocatorLocationService());
    gh.lazySingleton<_i912.IncidentService>(() => _i627.MockIncidentService());
    gh.factory<_i494.LocationRepository>(
      () => _i27.LocationRepositoryImpl(gh<_i554.LocationService>()),
    );
    gh.factory<_i494.IncidentRepository>(
      () => _i635.IncidentRepositoryImpl(gh<_i912.IncidentService>()),
    );
  }
}

class _$PreferencesModule extends _i467.PreferencesModule {}
