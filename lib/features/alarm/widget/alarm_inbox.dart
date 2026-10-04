import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_notifications.dart';
import 'package:dynamic_rcb_alerts/core/push/danger_alarm_navigator.dart';
import 'package:dynamic_rcb_alerts/features/alarm/bloc/alarm_inbox_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Sits above the router and opens the alarm screen for every danger alarm,
/// wherever it came from.
class AlarmInbox extends StatelessWidget {
  const AlarmInbox({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<AlarmInboxCubit>();
        unawaited(cubit.init());
        return cubit;
      },
      child: _AlarmInboxListener(child: child),
    );
  }
}

class _AlarmInboxListener extends HookWidget {
  const _AlarmInboxListener({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // The Android full-screen intent launches the app through the local
    // notification, not FCM; pick that alarm up once the router is ready.
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final alarm = await AlarmNotifications.launchAlarm();
        if (alarm != null) DangerAlarmNavigator.open(alarm);
      });
      return null;
    }, const []);

    return BlocPresentationListener<AlarmInboxCubit, AlarmInboxEvent>(
      listener: (_, event) => switch (event) {
        DangerAlarmReceived(:final alarm) => DangerAlarmNavigator.open(alarm),
      },
      child: child,
    );
  }
}
