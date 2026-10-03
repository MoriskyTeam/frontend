//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/domain_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:domain/src/repository/incident_repository.dart' as _i887;
import 'package:domain/src/repository/location_repository.dart' as _i71;
import 'package:domain/src/usecase/incident/confirm_incident_use_case.dart'
    as _i366;
import 'package:domain/src/usecase/incident/submit_report_use_case.dart'
    as _i49;
import 'package:domain/src/usecase/incident/watch_incidents_use_case.dart'
    as _i1038;
import 'package:domain/src/usecase/location/get_current_location_use_case.dart'
    as _i148;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i148.GetCurrentLocationUseCase>(
      () => _i148.GetCurrentLocationUseCase(gh<_i71.LocationRepository>()),
    );
    gh.factory<_i366.ConfirmIncidentUseCase>(
      () => _i366.ConfirmIncidentUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i49.SubmitReportUseCase>(
      () => _i49.SubmitReportUseCase(gh<_i887.IncidentRepository>()),
    );
    gh.factory<_i1038.WatchIncidentsUseCase>(
      () => _i1038.WatchIncidentsUseCase(gh<_i887.IncidentRepository>()),
    );
  }
}
