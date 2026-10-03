import 'package:data/src/service/auth/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Anonymous Supabase session: residents get a stable identity without a
/// sign-up form, so reporting stays a 15-second job.
@Injectable(as: AuthService)
class SupabaseAuthService implements AuthService {
  SupabaseAuthService(this._client);

  final SupabaseClient _client;

  /// A session restored from storage may have an access token that expired
  /// while the app was closed; Realtime rejects it (`InvalidJWTToken`), so
  /// refresh it before anything subscribes. A refresh token that no longer
  /// works falls back to a fresh anonymous identity.
  @override
  Future<void> ensureSignedIn() async {
    final session = _client.auth.currentSession;
    if (session == null) {
      await _client.auth.signInAnonymously();
      return;
    }
    if (!session.isExpired) return;
    try {
      await _client.auth.refreshSession();
    } on AuthException {
      await _client.auth.signInAnonymously();
    }
  }
}
