import 'package:data/src/model/incident/incident_dto.dart';
import 'package:data/src/model/incident/submit_report_dto.dart';
import 'package:data/src/model/incident/update_report_dto.dart';

abstract class IncidentService {
  Stream<List<IncidentDTO>> watchIncidents();

  Future<IncidentDTO> submitReport({required SubmitReportDTO data});

  Future<IncidentDTO> confirmIncident({required String incidentId});

  /// Edits the resident's own report through `update_my_report`.
  Future<IncidentDTO> updateReport({required UpdateReportDTO data});

  /// Deletes the resident's own report through `delete_my_report`, then
  /// its photo.
  Future<void> deleteReport({required String incidentId, String? photoUrl});
}
