import 'package:domain/src/model/result/common/no_result.dart';
import 'package:domain/src/model/result/incident/incident.dart';
import 'package:domain/src/repository/incident_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteReportUseCase extends BaseUseCase<Incident, NoResult> {
  DeleteReportUseCase(this._repository);

  final IncidentRepository _repository;

  @override
  Future<NoResult> execute(Incident param) async {
    await _repository.deleteReport(
      incidentId: param.id,
      photoUrl: param.photoPath,
    );
    return const NoResult();
  }
}
