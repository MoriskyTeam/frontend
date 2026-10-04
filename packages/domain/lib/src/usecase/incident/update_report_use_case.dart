import 'package:domain/src/model/request/incident/update_report_request.dart';
import 'package:domain/src/model/result/incident/incident.dart';
import 'package:domain/src/repository/incident_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateReportUseCase extends BaseUseCase<UpdateReportRequest, Incident> {
  UpdateReportUseCase(this._repository);

  final IncidentRepository _repository;

  @override
  Future<Incident> execute(UpdateReportRequest param) =>
      _repository.updateReport(request: param);
}
