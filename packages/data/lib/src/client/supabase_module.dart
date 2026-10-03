import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Single injection point for the Supabase client.
///
/// Services depend on this rather than on `Supabase.instance` directly so
/// tests can swap a fake client in.
@module
abstract class SupabaseModule {
  @lazySingleton
  SupabaseClient get client => Supabase.instance.client;
}
