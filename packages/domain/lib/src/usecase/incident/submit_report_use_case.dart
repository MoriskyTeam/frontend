import 'package:domain/src/model/request/incident/submit_report_request.dart';
import 'package:domain/src/model/result/incident/incident.dart';
import 'package:domain/src/repository/incident_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitReportUseCase extends BaseUseCase<SubmitReportRequest, Incident> {
  SubmitReportUseCase(this._repository);

  final IncidentRepository _repository;

  @override
  Future<Incident> execute(SubmitReportRequest param) =>
      _repository.submitReport(request: param);
}
