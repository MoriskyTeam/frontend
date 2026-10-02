import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Exposes `SharedPreferencesAsync` as a lazy singleton so services can
/// constructor-inject it without touching globals.
@module
abstract class PreferencesModule {
  @lazySingleton
  SharedPreferencesAsync get preferences => SharedPreferencesAsync();
}
