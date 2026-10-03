import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/service/auth/auth_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._service);

  final AuthService _service;

  @override
  Future<void> ensureSignedIn() async {
    try {
      await _service.ensureSignedIn();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }
}
