// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synop_reading_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SynopReadingDTO _$SynopReadingDTOFromJson(Map<String, dynamic> json) =>
    _SynopReadingDTO(
      stationId: (json['station_id'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDirection: (json['wind_direction'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      precipitation: (json['precipitation'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      measuredAt: json['measured_at'] == null
          ? null
          : DateTime.parse(json['measured_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SynopReadingDTOToJson(_SynopReadingDTO instance) =>
    <String, dynamic>{
      'station_id': instance.stationId,
      'temperature': instance.temperature,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'humidity': instance.humidity,
      'precipitation': instance.precipitation,
      'pressure': instance.pressure,
      'measured_at': instance.measuredAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
