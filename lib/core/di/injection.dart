import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesBefore: [
    ExternalModule(DomainPackageModule),
    ExternalModule(DataPackageModule),
  ],
)
Future<void> configureDependencies({String? environment}) async {
  getIt.init(environment: environment);
}
