import 'package:data/src/di/data_environment.dart';
import 'package:data/src/service/auth/auth_service.dart';
import 'package:injectable/injectable.dart';

/// The mock feed has no backend identity to establish.
@mockEnv
@Injectable(as: AuthService)
class MockAuthService implements AuthService {
  @override
  Future<void> ensureSignedIn() async {}
}
