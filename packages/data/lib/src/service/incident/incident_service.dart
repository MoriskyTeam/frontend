import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';

abstract class IncidentService {
  Stream<List<IncidentDTO>> watchIncidents();

  Future<IncidentDTO> submitReport({required SubmitReportDTO data});

  Future<IncidentDTO> confirmIncident({required String incidentId});
}
