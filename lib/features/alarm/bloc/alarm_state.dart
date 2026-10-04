part of 'alarm_cubit.dart';

@freezed
sealed class AlarmState with _$AlarmState {
  const factory AlarmState({
    @Default(false) bool ringing,
    @Default(true) bool strobe,
  }) = _AlarmState;
}
