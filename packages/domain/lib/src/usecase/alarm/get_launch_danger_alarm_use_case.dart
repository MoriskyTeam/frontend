import 'package:domain/src/model/result/alarm/danger_alarm.dart';
import 'package:domain/src/repository/alarm_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLaunchDangerAlarmUseCase extends BaseUseCaseNoParam<DangerAlarm?> {
  GetLaunchDangerAlarmUseCase(this._repository);

  final AlarmRepository _repository;

  @override
  Future<DangerAlarm?> execute() => _repository.getLaunchAlarm();
}
