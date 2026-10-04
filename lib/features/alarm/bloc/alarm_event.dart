part of 'alarm_cubit.dart';

sealed class AlarmEvent {
  const AlarmEvent();
}

/// The resident read the alarm; leave for the map, on the incident when
/// there is one.
final class AlarmAcknowledged extends AlarmEvent {
  const AlarmAcknowledged({required this.incidentId});

  final String? incidentId;
}
