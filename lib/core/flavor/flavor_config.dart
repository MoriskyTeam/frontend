/// Build-time environment selection.
///
/// Each entry-point (`main_development.dart`, `main_production.dart`) calls
/// [FlavorConfig.init] with its flavor *before* `runApp`, so the rest of the
/// app can read the active flavor synchronously.
enum Flavor {
  development,
  production
  ;

  String get displayName => switch (this) {
    Flavor.development => 'RCB Alerts Dev',
    Flavor.production => 'RCB Alerts',
  };

  bool get isDevelopment => this == Flavor.development;
  bool get isProduction => this == Flavor.production;
}

final class FlavorConfig {
  FlavorConfig._(this.flavor);

  static FlavorConfig? _instance;

  final Flavor flavor;

  static FlavorConfig get instance {
    final value = _instance;
    if (value == null) {
      throw StateError(
        'FlavorConfig has not been initialised. Call FlavorConfig.init() '
        'from the flavor entry-point before runApp.',
      );
    }
    return value;
  }

  static void init(Flavor flavor) {
    if (_instance != null) {
      throw StateError('FlavorConfig has already been initialised.');
    }
    _instance = FlavorConfig._(flavor);
  }
}
