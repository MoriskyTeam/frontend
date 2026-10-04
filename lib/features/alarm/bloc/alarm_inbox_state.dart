part of 'alarm_inbox_cubit.dart';

@freezed
sealed class AlarmInboxState with _$AlarmInboxState {
  const factory AlarmInboxState({
    @Default(null) String? lastSourceId,
  }) = _AlarmInboxState;
}

sealed class AlarmInboxEvent {
  const AlarmInboxEvent();
}

final class DangerAlarmReceived extends AlarmInboxEvent {
  const DangerAlarmReceived(this.alarm);

  final DangerAlarm alarm;
}
