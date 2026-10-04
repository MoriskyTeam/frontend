import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alarm_inbox_cubit.freezed.dart';
part 'alarm_inbox_state.dart';

/// App-wide listener for danger alarms from FCM: in the foreground, from a
/// tapped notification, and the one that launched the app.
@injectable
class AlarmInboxCubit extends Cubit<AlarmInboxState>
    with BlocPresentationMixin<AlarmInboxState, AlarmInboxEvent> {
  AlarmInboxCubit(this._watchAlarms, this._getLaunchAlarm)
    : super(const AlarmInboxState());

  final WatchDangerAlarmsUseCase _watchAlarms;
  final GetLaunchDangerAlarmUseCase _getLaunchAlarm;
  StreamSubscription<DangerAlarm>? _subscription;

  Future<void> init() async {
    _subscription = _watchAlarms.watch().listen(_deliver);
    final launch = await _getLaunchAlarm();
    launch.fold((_) {}, (alarm) {
      if (alarm != null) _deliver(alarm);
    });
  }

  void _deliver(DangerAlarm alarm) {
    emit(state.copyWith(lastSourceId: alarm.sourceId));
    emitPresentation(DangerAlarmReceived(alarm));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
