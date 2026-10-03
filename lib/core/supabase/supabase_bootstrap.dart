import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase connection for the app.
///
/// The project URL and publishable key are public by design (they ship in
/// every client; access is enforced by RLS), so they are built in — a run
/// from any IDE, `flutter run` or a CI build talks to Supabase without extra
/// flags. `config/supabase_<flavor>.json` (via `--dart-define-from-file`) can
/// still override them, e.g. to point at another project.
abstract final class SupabaseConfig {
  static const url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://mshhfivprfvgzrkhqwga.supabase.co',
  );

  /// The project's publishable key (`sb_publishable_…`); a legacy anon JWT
  /// works too.
  static const key = String.fromEnvironment(
    'SUPABASE_KEY',
    defaultValue: 'sb_publishable_wBNibGHaaDgNTHW7WOSLfQ_36L1VeX6',
  );
}

/// Initialises Supabase. There is no offline fallback: without a connection
/// the map stays empty and says so.
Future<void> bootstrapSupabase() => Supabase.initialize(
  url: SupabaseConfig.url,
  publishableKey: SupabaseConfig.key,
);
