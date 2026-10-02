import 'package:injectable/injectable.dart';

/// Marker for injectable_generator — emits `data_injection.module.dart`
/// containing `DataPackageModule`, referenced from the app's
/// `InjectableInit.externalPackageModulesBefore`.
@InjectableInit.microPackage()
void initDataPackageModule() {}
