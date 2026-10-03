import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:domain/src/repository/location_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressUseCase extends BaseUseCase<GeoPoint, String?> {
  GetAddressUseCase(this._repository);

  final LocationRepository _repository;

  @override
  Future<String?> execute(GeoPoint param) =>
      _repository.getAddress(point: param);
}
