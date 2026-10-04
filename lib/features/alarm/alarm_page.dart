import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/alarm/bloc/alarm_cubit.dart';
import 'package:dynamic_rcb_alerts/features/alarm/key/alarm_keys.dart';
import 'package:dynamic_rcb_alerts/features/alarm/model/alarm_effects.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

/// Full-screen danger alarm: red and bone alternate in step with the torch,
/// the siren loops, and one large button ends it.
class AlarmPage extends StatelessWidget {
  const AlarmPage({required this.alarm, super.key});

  final DangerAlarm alarm;

  @override
  Widget build(BuildContext context) {
    // Read here: a provider's create callback must not depend on context.
    final strobe = !MediaQuery.disableAnimationsOf(context);
    return BlocProvider(
      create: (_) {
        final cubit = getIt<AlarmCubit>(param1: alarm);
        unawaited(cubit.init(strobe: strobe));
        return cubit;
      },
      child: _AlarmView(alarm: alarm),
    );
  }
}

class _AlarmView extends HookWidget {
  const _AlarmView({required this.alarm});

  final DangerAlarm alarm;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AlarmCubit>().state;
    final flashing = state.ringing && state.strobe;
    final phase = useAnimationController(
      duration: AlarmEffects.strobePeriod * 2,
    );
    useEffect(() {
      if (flashing) {
        phase.repeat();
      } else {
        phase
          ..stop()
          ..value = 0;
      }
      return null;
    }, [flashing]);

    return BlocPresentationListener<AlarmCubit, AlarmEvent>(
      listener: (context, event) => switch (event) {
        AlarmAcknowledged(:final incidentId) => context.go(
          incidentId == null ? '/' : '/?incident=$incidentId',
        ),
      },
      child: AnimatedBuilder(
        animation: phase,
        builder: (context, _) {
          // First half of each period red, second half bone.
          final red = phase.value < 0.5;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: red ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
            child: Scaffold(
              key: AlarmKeys.page,
              backgroundColor: red ? RcbColors.signalRed : RcbColors.boneRaised,
              body: _AlarmBody(
                alarm: alarm,
                ink: red ? Colors.white : RcbColors.asphalt,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AlarmBody extends StatelessWidget {
  const _AlarmBody({required this.alarm, required this.ink});

  final DangerAlarm alarm;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    const band = BattenburgBand(
      primary: RcbColors.asphalt,
      secondary: RcbColors.hiVis,
      cell: 12,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        band,
        Expanded(
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                RcbSpacing.xl,
                RcbSpacing.lg,
                RcbSpacing.xl,
                RcbSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.alarmEyebrow.toUpperCase(),
                    style: text.labelLarge?.copyWith(
                      color: ink,
                      letterSpacing: 1.6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.warning_rounded, size: 72, color: ink),
                  const SizedBox(height: RcbSpacing.sm),
                  Semantics(
                    header: true,
                    liveRegion: true,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.alarmHeadline.toUpperCase(),
                        style: text.displaySmall?.copyWith(
                          color: ink,
                          fontSize: 64,
                          fontWeight: FontWeight.w800,
                          height: 0.95,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: RcbSpacing.lg),
                  if (alarm.title.isNotEmpty)
                    Text(
                      alarm.title,
                      style: text.headlineSmall?.copyWith(
                        color: ink,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  if (alarm.body.isNotEmpty) ...[
                    const SizedBox(height: RcbSpacing.xs),
                    Text(
                      alarm.body,
                      style: text.titleLarge?.copyWith(color: ink),
                    ),
                  ],
                  const Spacer(flex: 2),
                  _AcknowledgeButton(label: l10n.alarmAcknowledge),
                ],
              ),
            ),
          ),
        ),
        band,
        SizedBox(height: MediaQuery.paddingOf(context).bottom),
      ],
    );
  }
}

/// Stays asphalt and hi-vis through every flash so it is always the same
/// target under a shaking thumb.
class _AcknowledgeButton extends StatelessWidget {
  const _AcknowledgeButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      hint: l10n.alarmAcknowledgeHint,
      child: SizedBox(
        width: double.infinity,
        height: 72,
        child: FilledButton(
          key: AlarmKeys.acknowledge,
          style: FilledButton.styleFrom(
            backgroundColor: RcbColors.asphalt,
            foregroundColor: RcbColors.hiVis,
            shape: const RoundedRectangleBorder(
              borderRadius: RcbRadii.buttonBorder,
            ),
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          onPressed: () {
            unawaited(HapticFeedback.heavyImpact());
            unawaited(context.read<AlarmCubit>().acknowledge());
          },
          child: Text(label.toUpperCase()),
        ),
      ),
    );
  }
}
