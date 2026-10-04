import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/push/alarm_notifications.dart';
import 'package:dynamic_rcb_alerts/core/push/danger_alarm_navigator.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/alarm/bloc/alarm_settings_cubit.dart';
import 'package:dynamic_rcb_alerts/features/alarm/key/alarm_keys.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Danger alarm settings: on/off, the Android full-screen permission and a
/// local test that plays the real alarm without touching the server.
class AlarmSettingsSheet extends StatelessWidget {
  const AlarmSettingsSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => const AlarmSettingsSheet(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<AlarmSettingsCubit>();
        unawaited(cubit.init());
        return cubit;
      },
      child: const _AlarmSettingsBody(),
    );
  }
}

class _AlarmSettingsBody extends StatelessWidget {
  const _AlarmSettingsBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final android = defaultTargetPlatform == TargetPlatform.android;

    return BlocPresentationListener<AlarmSettingsCubit, AlarmSettingsEvent>(
      listener: (context, event) => switch (event) {
        AlarmSettingsFailed() => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.loadFailed))),
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            RcbSpacing.sm,
            0,
            RcbSpacing.sm,
            RcbSpacing.lg,
          ),
          child: BlocBuilder<AlarmSettingsCubit, AlarmSettingsState>(
            builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SwitchListTile(
                  key: AlarmKeys.settingsToggle,
                  value: state.enabled,
                  onChanged: state.loadingStatus.isLoaded
                      ? (enabled) => context
                            .read<AlarmSettingsCubit>()
                            .setEnabled(enabled: enabled)
                      : null,
                  title: Text(
                    l10n.alarmChannelName,
                    style: theme.textTheme.titleLarge,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: RcbSpacing.xs),
                    child: Text(l10n.alarmSettingsBody),
                  ),
                ),
                if (android && state.enabled) const _FullScreenTile(),
                const SizedBox(height: RcbSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: RcbSpacing.md,
                  ),
                  child: OutlinedButton.icon(
                    key: AlarmKeys.settingsTest,
                    onPressed: () {
                      Navigator.of(context).pop();
                      DangerAlarmNavigator.openTest(
                        DangerAlarm(
                          sourceId: 'test',
                          incidentId: null,
                          title: l10n.alarmTestTitle,
                          body: l10n.alarmTestBody,
                          location: const GeoPoint(
                            latitude: 50.0617,
                            longitude: 19.9373,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.campaign_outlined),
                    label: Text(l10n.alarmTestAction),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows whether a locked phone can be woken and, when it cannot, takes the
/// resident to the switch. Re-checks on return from system settings.
class _FullScreenTile extends HookWidget {
  const _FullScreenTile();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final allowed = useState<bool?>(null);

    Future<void> check() async {
      final value = await AlarmNotifications.canUseFullScreen();
      if (context.mounted) allowed.value = value;
    }

    useEffect(() {
      unawaited(check());
      return null;
    }, const []);
    useOnAppLifecycleStateChange((_, state) {
      if (state == AppLifecycleState.resumed) unawaited(check());
    });

    final granted = allowed.value;
    if (granted == null) return const SizedBox.shrink();
    return ListTile(
      leading: Icon(
        granted ? Icons.check_circle_rounded : Icons.error_rounded,
        color: granted ? muted : theme.colorScheme.error,
      ),
      title: Text(
        granted ? l10n.alarmFullScreenGranted : l10n.alarmFullScreenTitle,
      ),
      subtitle: Text(
        granted ? l10n.alarmFullScreenGrantedBody : l10n.alarmFullScreenBody,
        style: TextStyle(color: muted),
      ),
      trailing: granted ? null : const Icon(Icons.open_in_new_rounded),
      onTap: granted ? null : AlarmNotifications.openFullScreenSettings,
    );
  }
}
