// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/alarm/bloc/alarm_cubit.dart' as _i975;
import '../../features/alarm/bloc/alarm_inbox_cubit.dart' as _i754;
import '../../features/alarm/bloc/alarm_settings_cubit.dart' as _i77;
import '../../features/alarm/model/alarm_effects.dart' as _i367;
import '../../features/map/bloc/map_cubit.dart' as _i275;
import '../../features/report/bloc/report_cubit.dart' as _i71;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i494.DomainPackageModule().init(gh);
    await _i437.DataPackageModule().init(gh);
    gh.factory<_i367.AlarmEffects>(() => _i367.AlarmEffects());
    gh.factory<_i71.ReportCubit>(
      () => _i71.ReportCubit(
        gh<_i494.GetCurrentLocationUseCase>(),
        gh<_i494.GetAddressUseCase>(),
        gh<_i494.SubmitReportUseCase>(),
        gh<_i494.UpdateReportUseCase>(),
      ),
    );
    gh.factory<_i77.AlarmSettingsCubit>(
      () => _i77.AlarmSettingsCubit(
        gh<_i494.GetAlarmsEnabledUseCase>(),
        gh<_i494.SetAlarmsEnabledUseCase>(),
      ),
    );
    gh.factory<_i754.AlarmInboxCubit>(
      () => _i754.AlarmInboxCubit(
        gh<_i494.WatchDangerAlarmsUseCase>(),
        gh<_i494.GetLaunchDangerAlarmUseCase>(),
      ),
    );
    gh.factory<_i275.MapCubit>(
      () => _i275.MapCubit(
        gh<_i494.WatchIncidentsUseCase>(),
        gh<_i494.GetCurrentLocationUseCase>(),
        gh<_i494.ConfirmIncidentUseCase>(),
        gh<_i494.EnsureSignedInUseCase>(),
        gh<_i494.GetLatestRadarFrameUseCase>(),
        gh<_i494.RegisterPushDeviceUseCase>(),
        gh<_i494.DeleteReportUseCase>(),
      ),
    );
    gh.factoryParam<_i975.AlarmCubit, _i494.DangerAlarm, dynamic>(
      (_alarm, _) => _i975.AlarmCubit(gh<_i367.AlarmEffects>(), _alarm),
    );
    return this;
  }
}
