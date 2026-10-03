import 'package:data/src/error/supabase_error_mapper.dart';
import 'package:data/src/mapper/incident_mappers.dart';
import 'package:data/src/service/incident/incident_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IncidentRepository)
class IncidentRepositoryImpl extends IncidentRepository {
  IncidentRepositoryImpl(this._service);

  final IncidentService _service;

  @override
  Stream<List<Incident>> watchIncidents() => _service.watchIncidents().map(
    (incidents) => [for (final dto in incidents) dto.toDomain()],
  );

  @override
  Future<Incident> submitReport({
    required SubmitReportRequest request,
  }) async {
    try {
      final dto = await _service.submitReport(data: request.toData());
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }

  @override
  Future<Incident> confirmIncident({required String incidentId}) async {
    try {
      final dto = await _service.confirmIncident(incidentId: incidentId);
      return dto.toDomain();
    } on Object catch (e, stack) {
      throw e.toApiException(stack);
    }
  }
}
