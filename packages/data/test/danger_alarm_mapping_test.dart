import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

Map<String, dynamic> _data({
  String kind = 'danger_alarm',
  String incidentId = 'abc123',
  String lat = '50.0656',
}) => {
  'kind': kind,
  'source_id': 'incident:abc123',
  'incident_id': incidentId,
  'title': 'Zalane przejście podziemne',
  'body': 'Rondo Mogilskie',
  'lat': lat,
  'lng': '19.9603',
};

void main() {
  test(
    'GIVEN the data block of a send-alarm FCM message,\n'
    'WHEN mapped,\n'
    'THEN it becomes a danger alarm at that place',
    () {
      final alarm = DangerAlarmDTO.fromJson(_data()).toDomain();

      expect(
        alarm,
        const DangerAlarm(
          sourceId: 'incident:abc123',
          incidentId: 'abc123',
          title: 'Zalane przejście podziemne',
          body: 'Rondo Mogilskie',
          location: GeoPoint(latitude: 50.0656, longitude: 19.9603),
        ),
      );
    },
  );

  test(
    'GIVEN an operator alert without an incident,\n'
    'WHEN mapped,\n'
    'THEN the incident id is null, not empty',
    () {
      expect(
        DangerAlarmDTO.fromJson(_data(incidentId: '')).toDomain()?.incidentId,
        isNull,
      );
    },
  );

  test(
    'GIVEN another kind of message or one without a usable place,\n'
    'WHEN mapped,\n'
    'THEN it is not an alarm',
    () {
      expect(DangerAlarmDTO.fromJson(_data(kind: 'news')).toDomain(), isNull);
      expect(DangerAlarmDTO.fromJson(_data(lat: 'x')).toDomain(), isNull);
      expect(DangerAlarmDTO.fromJson(const {}).toDomain(), isNull);
    },
  );

  test(
    'GIVEN a danger alarm,\n'
    'WHEN sent through a notification payload and back,\n'
    'THEN it comes back unchanged',
    () {
      final alarm = DangerAlarmDTO.fromJson(_data()).toDomain()!;

      expect(
        DangerAlarmDTO.fromJson(alarm.toDTO().toJson()).toDomain(),
        alarm,
      );
    },
  );
}
