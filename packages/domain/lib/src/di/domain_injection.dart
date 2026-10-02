import 'package:injectable/injectable.dart';

/// Marker for injectable_generator — it scans this package and emits
/// `domain_injection.module.dart` with `DomainPackageModule`. The app's
/// `InjectableInit` references that module via `externalPackageModulesBefore`,
/// which is how cross-package use cases become resolvable from `getIt`.
@InjectableInit.microPackage()
void initDomainPackageModule() {}
