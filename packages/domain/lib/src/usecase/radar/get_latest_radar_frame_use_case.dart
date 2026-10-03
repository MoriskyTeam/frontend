import 'package:domain/src/model/result/radar/radar_frame.dart';
import 'package:domain/src/repository/radar_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLatestRadarFrameUseCase extends BaseUseCaseNoParam<RadarFrame?> {
  GetLatestRadarFrameUseCase(this._repository);

  final RadarRepository _repository;

  @override
  Future<RadarFrame?> execute() => _repository.getLatestFrame();
}
