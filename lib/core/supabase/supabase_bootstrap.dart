import 'package:data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase connection for the app.
///
/// The project URL and publishable key are public by design (they ship in
/// every client; access is enforced by RLS), so they are built in — a run
/// from any IDE, `flutter run` or a CI build talks to Supabase without extra
/// flags. `config/supabase_<flavor>.json` (via `--dart-define-from-file`) can
/// still override them, e.g. to point at another project.
///
/// The mock feed only runs when asked for explicitly:
/// `--dart-define=USE_MOCK=true`.
abstract final class SupabaseConfig {
  static const _defaultUrl = 'https://mshhfivprfvgzrkhqwga.supabase.co';
  static const _defaultKey = 'sb_publishable_wBNibGHaaDgNTHW7WOSLfQ_36L1VeX6';

  static const url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: _defaultUrl,
  );

  /// The project's publishable key (`sb_publishable_…`); a legacy anon JWT
  /// works too.
  static const key = String.fromEnvironment(
    'SUPABASE_KEY',
    defaultValue: _defaultKey,
  );

  static const useMock = bool.fromEnvironment('USE_MOCK');

  static bool get isConfigured => !useMock && url.isNotEmpty && key.isNotEmpty;
}

/// Initialises Supabase unless the mock was requested and returns the data
/// environment dependency injection should bind to.
Future<String> bootstrapSupabase() async {
  if (!SupabaseConfig.isConfigured) return DataEnvironment.mock;
  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.key,
  );
  return DataEnvironment.supabase;
}
