part of 'report_cubit.dart';

@immutable
sealed class ReportEvent {
  const ReportEvent();
}

class ReportSubmitted extends ReportEvent {
  const ReportSubmitted(this.incident);

  final Incident incident;
}

class ReportFailed extends ReportEvent {
  const ReportFailed(this.error);

  final ErrorResult error;
}
