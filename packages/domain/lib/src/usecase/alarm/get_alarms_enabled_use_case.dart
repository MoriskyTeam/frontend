import 'package:domain/src/repository/alarm_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAlarmsEnabledUseCase extends BaseUseCaseNoParam<bool> {
  GetAlarmsEnabledUseCase(this._repository);

  final AlarmRepository _repository;

  @override
  Future<bool> execute() => _repository.areAlarmsEnabled();
}
