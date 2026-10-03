// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_maps_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherMapsDTO _$WeatherMapsDTOFromJson(Map<String, dynamic> json) =>
    _WeatherMapsDTO(
      host: json['host'] as String?,
      radar: json['radar'] == null
          ? null
          : RadarFramesDTO.fromJson(json['radar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherMapsDTOToJson(_WeatherMapsDTO instance) =>
    <String, dynamic>{'host': instance.host, 'radar': instance.radar};
