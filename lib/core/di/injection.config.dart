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
    gh.factory<_i71.ReportCubit>(
      () => _i71.ReportCubit(
        gh<_i494.GetCurrentLocationUseCase>(),
        gh<_i494.GetAddressUseCase>(),
        gh<_i494.SubmitReportUseCase>(),
      ),
    );
    gh.factory<_i275.MapCubit>(
      () => _i275.MapCubit(
        gh<_i494.WatchIncidentsUseCase>(),
        gh<_i494.GetCurrentLocationUseCase>(),
        gh<_i494.ConfirmIncidentUseCase>(),
        gh<_i494.EnsureSignedInUseCase>(),
        gh<_i494.GetLatestRadarFrameUseCase>(),
      ),
    );
    return this;
  }
}
