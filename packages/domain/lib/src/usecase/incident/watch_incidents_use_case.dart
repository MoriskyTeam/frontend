import 'package:domain/src/model/result/incident/incident.dart';
import 'package:domain/src/repository/incident_repository.dart';
import 'package:injectable/injectable.dart';

/// Stream wrapper — not a `BaseUseCase` because the latter is one-shot.
/// Cubits subscribe via `.watch().listen(...)`.
@injectable
class WatchIncidentsUseCase {
  WatchIncidentsUseCase(this._repository);

  final IncidentRepository _repository;

  Stream<List<Incident>> watch() => _repository.watchIncidents();
}
