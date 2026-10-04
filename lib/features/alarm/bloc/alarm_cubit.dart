import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/alarm/model/alarm_effects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alarm_cubit.freezed.dart';
part 'alarm_event.dart';
part 'alarm_state.dart';

/// Rings the phone for one [DangerAlarm] until the resident acknowledges
/// it or [autoStop] passes.
@injectable
class AlarmCubit extends Cubit<AlarmState>
    with BlocPresentationMixin<AlarmState, AlarmEvent> {
  AlarmCubit(this._effects, @factoryParam this._alarm)
    : super(const AlarmState());

  /// A forgotten phone must not ring until its battery dies.
  static const autoStop = Duration(minutes: 2);

  final AlarmEffects _effects;
  final DangerAlarm _alarm;
  Timer? _autoStop;

  /// [strobe] is false when the resident asked for reduced motion: the
  /// screen stays red and the torch stays on instead of flashing.
  Future<void> init({required bool strobe}) async {
    emit(state.copyWith(ringing: true, strobe: strobe));
    _autoStop = Timer(autoStop, () => unawaited(silence()));
    await _effects.start(strobe: strobe);
  }

  /// Stops the siren but keeps the alarm on screen to be read.
  Future<void> silence() async {
    _autoStop?.cancel();
    if (isClosed) return;
    emit(state.copyWith(ringing: false));
    await _effects.stop();
  }

  Future<void> acknowledge() async {
    await silence();
    emitPresentation(AlarmAcknowledged(incidentId: _alarm.incidentId));
  }

  @override
  Future<void> close() async {
    _autoStop?.cancel();
    await _effects.dispose();
    return super.close();
  }
}
