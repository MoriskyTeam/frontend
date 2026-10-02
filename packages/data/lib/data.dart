/// Dynamic RCB Alerts data layer.
///
/// Firebase services, DTOs, mappers, and repository implementations. May
/// depend on `domain` only — never on the app layer.
library;

export 'src/client/firebase_client.dart';
export 'src/di/data_injection.dart';
export 'src/di/data_injection.module.dart';
export 'src/error/firebase_error_mapper.dart';
export 'src/local_storage/preferences_module.dart';
