//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:data/src/client/supabase_module.dart' as _i570;
import 'package:data/src/local_storage/preferences_module.dart' as _i467;
import 'package:data/src/repository/auth_repository_impl.dart' as _i40;
import 'package:data/src/repository/incident_repository_impl.dart' as _i635;
import 'package:data/src/repository/location_repository_impl.dart' as _i27;
import 'package:data/src/service/auth/auth_service.dart' as _i1054;
import 'package:data/src/service/auth/mock_auth_service.dart' as _i150;
import 'package:data/src/service/auth/supabase_auth_service.dart' as _i1067;
import 'package:data/src/service/incident/incident_service.dart' as _i912;
import 'package:data/src/service/incident/mock_incident_service.dart' as _i627;
import 'package:data/src/service/incident/supabase_incident_service.dart'
    as _i899;
import 'package:data/src/service/location/geolocator_location_service.dart'
    as _i744;
import 'package:data/src/service/location/location_service.dart' as _i554;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

const String _mock = 'mock';
const String _supabase = 'supabase';

class DataPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final preferencesModule = _$PreferencesModule();
    final supabaseModule = _$SupabaseModule();
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => preferencesModule.preferences,
    );
    gh.lazySingleton<_i912.IncidentService>(
      () => _i627.MockIncidentService(),
      registerFor: {_mock},
    );
    gh.factory<_i1054.AuthService>(
      () => _i150.MockAuthService(),
      registerFor: {_mock},
    );
    gh.factory<_i554.LocationService>(() => _i744.GeolocatorLocationService());
    gh.lazySingleton<_i454.SupabaseClient>(
      () => supabaseModule.client,
      registerFor: {_supabase},
    );
    gh.factory<_i494.LocationRepository>(
      () => _i27.LocationRepositoryImpl(gh<_i554.LocationService>()),
    );
    gh.factory<_i1054.AuthService>(
      () => _i1067.SupabaseAuthService(gh<_i454.SupabaseClient>()),
      registerFor: {_supabase},
    );
    gh.lazySingleton<_i912.IncidentService>(
      () => _i899.SupabaseIncidentService(gh<_i454.SupabaseClient>()),
      registerFor: {_supabase},
    );
    gh.factory<_i494.IncidentRepository>(
      () => _i635.IncidentRepositoryImpl(gh<_i912.IncidentService>()),
    );
    gh.factory<_i494.AuthRepository>(
      () => _i40.AuthRepositoryImpl(gh<_i1054.AuthService>()),
    );
  }
}

class _$PreferencesModule extends _i467.PreferencesModule {}

class _$SupabaseModule extends _i570.SupabaseModule {}
