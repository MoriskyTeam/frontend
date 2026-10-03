// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gios_station_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiosStationDTO _$GiosStationDTOFromJson(Map<String, dynamic> json) =>
    _GiosStationDTO(
      stationId: (json['station_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      pm25SensorId: (json['pm25_sensor_id'] as num?)?.toInt(),
      pm10SensorId: (json['pm10_sensor_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GiosStationDTOToJson(_GiosStationDTO instance) =>
    <String, dynamic>{
      'station_id': instance.stationId,
      'code': instance.code,
      'name': instance.name,
      'city': instance.city,
      'street': instance.street,
      'lat': instance.lat,
      'lng': instance.lng,
      'pm25_sensor_id': instance.pm25SensorId,
      'pm10_sensor_id': instance.pm10SensorId,
    };
