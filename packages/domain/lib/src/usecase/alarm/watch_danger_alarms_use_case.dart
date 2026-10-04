import 'package:domain/src/model/result/alarm/danger_alarm.dart';
import 'package:domain/src/repository/alarm_repository.dart';
import 'package:injectable/injectable.dart';

/// Stream wrapper — not a `BaseUseCase` because the latter is one-shot.
@injectable
class WatchDangerAlarmsUseCase {
  WatchDangerAlarmsUseCase(this._repository);

  final AlarmRepository _repository;

  Stream<DangerAlarm> watch() => _repository.watchAlarms();
}
