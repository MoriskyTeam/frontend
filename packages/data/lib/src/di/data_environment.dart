import 'package:injectable/injectable.dart';

/// Which backend the data layer binds to. The app picks one at bootstrap:
/// [supabaseEnv] when Supabase keys are configured, [mockEnv] otherwise.
const mockEnv = Environment(DataEnvironment.mock);
const supabaseEnv = Environment(DataEnvironment.supabase);

abstract final class DataEnvironment {
  static const mock = 'mock';
  static const supabase = 'supabase';
}
