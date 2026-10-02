import 'package:domain/src/model/result/location/user_location.dart';
import 'package:domain/src/repository/location_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentLocationUseCase extends BaseUseCaseNoParam<UserLocation> {
  GetCurrentLocationUseCase(this._repository);

  final LocationRepository _repository;

  @override
  Future<UserLocation> execute() => _repository.getCurrentLocation();
}
