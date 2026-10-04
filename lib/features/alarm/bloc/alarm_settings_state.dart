part of 'alarm_settings_cubit.dart';

@freezed
sealed class AlarmSettingsState with _$AlarmSettingsState {
  const factory AlarmSettingsState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default(true) bool enabled,
  }) = _AlarmSettingsState;
}

sealed class AlarmSettingsEvent {
  const AlarmSettingsEvent();
}

final class AlarmSettingsFailed extends AlarmSettingsEvent {
  const AlarmSettingsFailed(this.error);

  final ErrorResult error;
}
