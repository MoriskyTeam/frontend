import 'package:domain/src/model/result/common/no_result.dart';
import 'package:domain/src/repository/alarm_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetAlarmsEnabledUseCase extends BaseUseCase<bool, NoResult> {
  SetAlarmsEnabledUseCase(this._repository);

  final AlarmRepository _repository;

  @override
  Future<NoResult> execute(bool enabled) async {
    await _repository.setAlarmsEnabled(enabled: enabled);
    return const NoResult();
  }
}
