import 'package:data/src/service/auth/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Anonymous Supabase session: residents get a stable identity without a
/// sign-up form, so reporting stays a 15-second job.
@Injectable(as: AuthService)
class SupabaseAuthService implements AuthService {
  SupabaseAuthService(this._client);

  final SupabaseClient _client;

  @override
  Future<void> ensureSignedIn() async {
    if (_client.auth.currentSession != null) return;
    await _client.auth.signInAnonymously();
  }
}
