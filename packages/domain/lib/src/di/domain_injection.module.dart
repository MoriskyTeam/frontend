//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/domain_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:domain/src/repository/alarm_repository.dart' as _i1048;
import 'package:domain/src/repository/auth_repository.dart' as _i722;
import 'package:domain/src/repository/incident_repository.dart' as _i887;
import 'package:domain/src/repository/location_repository.dart' as _i71;
import 'package:domain/src/repository/radar_repository.dart' as _i288;
import 'package:domain/src/usecase/alarm/get_alarms_enabled_use_case.dart'
    as _i668;
import 'package:domain/src/usecase/alarm/get_launch_danger_alarm_use_case.dart'
    as _i479;
import 'package:domain/src/usecase/alarm/register_push_device_use_case.dart'
    as _i635;
import 'package:domain/src/usecase/alarm/set_alarms_enabled_use_case.dart'
    as _i199;
import 'package:domain/src/usecase/alarm/watch_danger_alarms_use_case.dart'
    as _i628;
import 'package:domain/src/usecase/auth/ensure_signed_in_use_case.dart'
    as _i612;
import 'package:domain/src/usecase/incident/confirm_incident_use_case.dart'
    as _i366;
import 'package:domain/src/usecase/incident/delete_report_use_case.dart'
    as _i193;
import 'package:domain/src/usecase/incident/submit_report_use_case.dart'
    as _i49;
import 'package:domain/src/usecase/incident/update_report_use_case.dart'
    as _i781;
import 'package:domain/src/usecase/incident/watch_incidents_use_case.dart'
    as _i1038;
import 'package:domain/src/usecase/location/get_address_use_case.dart' as _i932;
import 'package:domain/src/usecase/location/get_current_location_use_case.dart'
    as _i148;
import 'package:domain/src/usecase/radar/get_latest_radar_frame_use_case.dart'
    as _i511;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i668.GetAlarmsEnabledUseCase>(
      () => _i668.GetAlarmsEnabledUseCase(gh<_i1048.AlarmRepository>()),
    );
    gh.factory<_i479.GetLaunchDangerAlarmUseCase>(
      () => _i479.GetLaunchDangerAlarmUseCase(gh<_i1048.AlarmRepository>()),
    );
    gh.factory<_i635.RegisterPushDeviceUseCase>(
      () => _i635.RegisterPushDeviceUseCase(gh<_i1048.AlarmRepository>()),
    );
    gh.factory<_i199.SetAlarmsEnabledUseCase>(
      () => _i199.SetAlarmsEnabledUseCase(gh<_i1048.AlarmRepository>()),
    );
    gh.factory<_i932.GetAddressUseCase>(
      () => _i932.GetAddressUseCase(gh<_i71.LocationRepository>()),
    );
    gh.factory<_i148.GetCurrentLocationUseCase>(
      () => _i148.GetCurrentLocationUseCase(gh<_i71.LocationRepository>()),
    );
    gh.factory<_i628.WatchDangerAlarmsUseCase>(
      () => _i628.WatchDangerAlarmsUseCase(gh<_i1048.AlarmRepository>()),
    );
    gh.factory<_i511.GetLatestRadarFrameUseCase>(
      () => _i511.GetLatestRadarFrameUseCase(gh<_i288.RadarRepository>()),
    );
    gh.factory<_i366.ConfirmIncidentUseCase>(
      () => _i366.ConfirmIncidentUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i193.DeleteReportUseCase>(
      () => _i193.DeleteReportUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i49.SubmitReportUseCase>(
      () => _i49.SubmitReportUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i781.UpdateReportUseCase>(
      () => _i781.UpdateReportUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i1038.WatchIncidentsUseCase>(
      () => _i1038.WatchIncidentsUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i612.EnsureSignedInUseCase>(
      () => _i612.EnsureSignedInUseCase(gh<_i722.AuthRepository>()),
    );
  }
}
