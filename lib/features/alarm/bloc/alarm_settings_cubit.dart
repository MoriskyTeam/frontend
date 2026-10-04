import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alarm_settings_cubit.freezed.dart';
part 'alarm_settings_state.dart';

@injectable
class AlarmSettingsCubit extends Cubit<AlarmSettingsState>
    with BlocPresentationMixin<AlarmSettingsState, AlarmSettingsEvent> {
  AlarmSettingsCubit(this._getEnabled, this._setEnabled)
    : super(const AlarmSettingsState());

  final GetAlarmsEnabledUseCase _getEnabled;
  final SetAlarmsEnabledUseCase _setEnabled;

  Future<void> init() async {
    final result = await _getEnabled();
    result.fold(
      (error) => emitPresentation(AlarmSettingsFailed(error)),
      (enabled) => emit(
        state.copyWith(enabled: enabled, loadingStatus: LoadingStatus.loaded),
      ),
    );
  }

  Future<void> setEnabled({required bool enabled}) async {
    final previous = state.enabled;
    emit(state.copyWith(enabled: enabled));
    final result = await _setEnabled(enabled);
    result.fold((error) {
      emit(state.copyWith(enabled: previous));
      emitPresentation(AlarmSettingsFailed(error));
    }, (_) {});
  }
}
