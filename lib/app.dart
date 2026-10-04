import 'package:dynamic_rcb_alerts/core/flavor/flavor_config.dart';
import 'package:dynamic_rcb_alerts/core/routing/app_router.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_theme.dart';
import 'package:dynamic_rcb_alerts/features/alarm/widget/alarm_inbox.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RcbAlertsApp extends StatelessWidget {
  const RcbAlertsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.instance.flavor.displayName,
      debugShowCheckedModeBanner: false,
      theme: RcbTheme.light(),
      darkTheme: RcbTheme.dark(),
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      // Status / navigation bar icons follow the theme: dark icons over the
      // light map, light icons over the night map.
      builder: (context, child) {
        final dark = Theme.of(context).brightness == Brightness.dark;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: (dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
              .copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
              ),
          child: AlarmInbox(child: child!),
        );
      },
    );
  }
}
