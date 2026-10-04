import 'package:domain/src/model/result/common/no_result.dart';
import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:domain/src/repository/alarm_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterPushDeviceUseCase extends BaseUseCase<GeoPoint?, NoResult> {
  RegisterPushDeviceUseCase(this._repository);

  final AlarmRepository _repository;

  @override
  Future<NoResult> execute(GeoPoint? location) async {
    await _repository.registerDevice(location: location);
    return const NoResult();
  }
}
