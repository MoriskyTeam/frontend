// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) => _LocationDTO(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  isFallback: json['is_fallback'] as bool?,
);

Map<String, dynamic> _$LocationDTOToJson(_LocationDTO instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'is_fallback': instance.isFallback,
    };
