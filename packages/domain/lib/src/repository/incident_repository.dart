import 'package:domain/src/model/request/incident/submit_report_request.dart';
import 'package:domain/src/model/result/incident/incident.dart';

abstract class IncidentRepository {
  /// Live snapshot of every known incident. Emits the current list on
  /// subscription and again whenever anything arrives or changes.
  Stream<List<Incident>> watchIncidents();

  Future<Incident> submitReport({required SubmitReportRequest request});

  Future<Incident> confirmIncident({required String incidentId});
}
