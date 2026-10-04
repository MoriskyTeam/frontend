// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danger_alarm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DangerAlarmDTO _$DangerAlarmDTOFromJson(Map<String, dynamic> json) =>
    _DangerAlarmDTO(
      kind: json['kind'] as String?,
      sourceId: json['source_id'] as String?,
      incidentId: json['incident_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$DangerAlarmDTOToJson(_DangerAlarmDTO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'source_id': instance.sourceId,
      'incident_id': instance.incidentId,
      'title': instance.title,
      'body': instance.body,
      'lat': instance.lat,
      'lng': instance.lng,
    };
