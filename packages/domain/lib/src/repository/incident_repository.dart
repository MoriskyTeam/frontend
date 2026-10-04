import 'package:domain/src/model/request/incident/submit_report_request.dart';
import 'package:domain/src/model/request/incident/update_report_request.dart';
import 'package:domain/src/model/result/incident/incident.dart';

abstract class IncidentRepository {
  /// Live snapshot of every known incident. Emits the current list on
  /// subscription and again whenever anything arrives or changes.
  Stream<List<Incident>> watchIncidents();

  Future<Incident> submitReport({required SubmitReportRequest request});

  Future<Incident> confirmIncident({required String incidentId});

  /// Changes category, title, description or photo of a report the
  /// resident filed; returns the updated incident.
  Future<Incident> updateReport({required UpdateReportRequest request});

  /// Deletes a report the resident filed, for everyone, with its photo.
  Future<void> deleteReport({required String incidentId, String? photoUrl});
}
