import 'package:data/src/di/data_environment.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Single injection point for the Supabase client.
///
/// Services depend on this rather than on `Supabase.instance` directly so
/// tests can swap a fake client in. Only registered in the Supabase
/// environment — the mock environment never touches Supabase.
@module
abstract class SupabaseModule {
  @supabaseEnv
  @lazySingleton
  SupabaseClient get client => Supabase.instance.client;
}
