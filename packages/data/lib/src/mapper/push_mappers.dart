import 'package:data/src/model/push/danger_alarm_dto.dart';
import 'package:domain/domain.dart';

extension DangerAlarmDTOMapper on DangerAlarmDTO {
  /// Null for any other kind of message, or one without a usable place.
  DangerAlarm? toDomain() {
    final lat = double.tryParse(this.lat ?? '');
    final lng = double.tryParse(this.lng ?? '');
    final sourceId = this.sourceId;
    if (kind != 'danger_alarm' ||
        sourceId == null ||
        lat == null ||
        lng == null) {
      return null;
    }
    final incidentId = this.incidentId;
    return DangerAlarm(
      sourceId: sourceId,
      incidentId: incidentId == null || incidentId.isEmpty ? null : incidentId,
      title: title ?? '',
      body: body ?? '',
      location: GeoPoint(latitude: lat, longitude: lng),
    );
  }
}

extension DangerAlarmMapper on DangerAlarm {
  /// Back to the wire shape, e.g. to carry an alarm in a notification
  /// payload or a route.
  DangerAlarmDTO toDTO() => DangerAlarmDTO(
    kind: 'danger_alarm',
    sourceId: sourceId,
    incidentId: incidentId ?? '',
    title: title,
    body: body,
    lat: '${location.latitude}',
    lng: '${location.longitude}',
  );
}
