// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gios_reading_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiosReadingDTO _$GiosReadingDTOFromJson(Map<String, dynamic> json) =>
    _GiosReadingDTO(
      sensorId: (json['sensor_id'] as num?)?.toInt(),
      stationId: (json['station_id'] as num?)?.toInt(),
      pollutant: json['pollutant'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      measuredAt: json['measured_at'] == null
          ? null
          : DateTime.parse(json['measured_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GiosReadingDTOToJson(_GiosReadingDTO instance) =>
    <String, dynamic>{
      'sensor_id': instance.sensorId,
      'station_id': instance.stationId,
      'pollutant': instance.pollutant,
      'value': instance.value,
      'measured_at': instance.measuredAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
