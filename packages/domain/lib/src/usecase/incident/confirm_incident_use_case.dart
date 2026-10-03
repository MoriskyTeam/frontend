import 'package:domain/src/model/result/incident/incident.dart';
import 'package:domain/src/repository/incident_repository.dart';
import 'package:domain/src/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmIncidentUseCase extends BaseUseCase<String, Incident> {
  ConfirmIncidentUseCase(this._repository);

  final IncidentRepository _repository;

  @override
  Future<Incident> execute(String param) =>
      _repository.confirmIncident(incidentId: param);
}
