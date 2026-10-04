//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:data/src/client/supabase_module.dart' as _i570;
import 'package:data/src/local_storage/preferences_module.dart' as _i467;
import 'package:data/src/repository/alarm_repository_impl.dart' as _i606;
import 'package:data/src/repository/auth_repository_impl.dart' as _i40;
import 'package:data/src/repository/incident_repository_impl.dart' as _i635;
import 'package:data/src/repository/location_repository_impl.dart' as _i27;
import 'package:data/src/repository/radar_repository_impl.dart' as _i742;
import 'package:data/src/service/air_quality/air_quality_service.dart' as _i219;
import 'package:data/src/service/air_quality/supabase_air_quality_service.dart'
    as _i850;
import 'package:data/src/service/auth/auth_service.dart' as _i1054;
import 'package:data/src/service/auth/supabase_auth_service.dart' as _i1067;
import 'package:data/src/service/geocoding/geocoding_service.dart' as _i939;
import 'package:data/src/service/geocoding/nominatim_geocoding_service.dart'
    as _i736;
import 'package:data/src/service/incident/incident_service.dart' as _i912;
import 'package:data/src/service/incident/supabase_incident_service.dart'
    as _i899;
import 'package:data/src/service/location/geolocator_location_service.dart'
    as _i744;
import 'package:data/src/service/location/location_service.dart' as _i554;
import 'package:data/src/service/push/firebase_push_messaging_service.dart'
    as _i284;
import 'package:data/src/service/push/push_device_service.dart' as _i624;
import 'package:data/src/service/push/push_messaging_service.dart' as _i644;
import 'package:data/src/service/push/supabase_push_device_service.dart'
    as _i383;
import 'package:data/src/service/radar/radar_service.dart' as _i217;
import 'package:data/src/service/radar/rainviewer_radar_service.dart' as _i251;
import 'package:data/src/service/weather/supabase_weather_service.dart'
    as _i752;
import 'package:data/src/service/weather/weather_service.dart' as _i1009;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final supabaseModule = _$SupabaseModule();
    final preferencesModule = _$PreferencesModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.client);
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
        () => preferencesModule.preferences);
    gh.factory<_i217.RadarService>(() => _i251.RainViewerRadarService());
    gh.factory<_i554.LocationService>(() => _i744.GeolocatorLocationService());
    gh.lazySingleton<_i644.PushMessagingService>(
        () => _i284.FirebasePushMessagingService());
    gh.factory<_i939.GeocodingService>(() => _i736.NominatimGeocodingService());
    gh.lazySingleton<_i1009.WeatherService>(
        () => _i752.SupabaseWeatherService(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i219.AirQualityService>(
        () => _i850.SupabaseAirQualityService(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i624.PushDeviceService>(
        () => _i383.SupabasePushDeviceService(gh<_i454.SupabaseClient>()));
    gh.factory<_i1054.AuthService>(
        () => _i1067.SupabaseAuthService(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i912.IncidentService>(
        () => _i899.SupabaseIncidentService(gh<_i454.SupabaseClient>()));
    gh.factory<_i494.RadarRepository>(
        () => _i742.RadarRepositoryImpl(gh<_i217.RadarService>()));
    gh.factory<_i494.LocationRepository>(() => _i27.LocationRepositoryImpl(
          gh<_i554.LocationService>(),
          gh<_i939.GeocodingService>(),
        ));
    gh.factory<_i494.AlarmRepository>(() => _i606.AlarmRepositoryImpl(
          gh<_i644.PushMessagingService>(),
          gh<_i624.PushDeviceService>(),
          gh<_i460.SharedPreferencesAsync>(),
        ));
    gh.factory<_i494.IncidentRepository>(() => _i635.IncidentRepositoryImpl(
          gh<_i912.IncidentService>(),
          gh<_i219.AirQualityService>(),
          gh<_i1009.WeatherService>(),
          gh<_i1054.AuthService>(),
        ));
    gh.factory<_i494.AuthRepository>(
        () => _i40.AuthRepositoryImpl(gh<_i1054.AuthService>()));
  }
}

class _$SupabaseModule extends _i570.SupabaseModule {}

class _$PreferencesModule extends _i467.PreferencesModule {}
