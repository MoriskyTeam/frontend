import 'package:data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase keys come from `--dart-define-from-file=config/supabase_<flavor>.json`
/// (see `config/supabase.example.json`). Without them the app runs on the
/// mock feed, so a fresh clone still demos.
abstract final class SupabaseConfig {
  static const url = String.fromEnvironment('SUPABASE_URL');

  /// The project's publishable key (`sb_publishable_…`); a legacy anon JWT
  /// works too.
  static const key = String.fromEnvironment('SUPABASE_KEY');

  static bool get isConfigured => url.isNotEmpty && key.isNotEmpty;
}

/// Initialises Supabase when configured and returns the data environment
/// dependency injection should bind to.
Future<String> bootstrapSupabase() async {
  if (!SupabaseConfig.isConfigured) return DataEnvironment.mock;
  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.key,
  );
  return DataEnvironment.supabase;
}
