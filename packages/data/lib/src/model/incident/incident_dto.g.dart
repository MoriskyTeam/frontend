// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentDTO _$IncidentDTOFromJson(Map<String, dynamic> json) => _IncidentDTO(
  id: json['id'] as String?,
  layer: json['layer'] as String?,
  category: json['category'] as String?,
  severity: json['severity'] as String?,
  status: json['status'] as String?,
  source: json['source'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  address: json['address'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  reportedAt: json['reported_at'] == null
      ? null
      : DateTime.parse(json['reported_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  confirmations: (json['confirmations'] as num?)?.toInt(),
  areaRadiusMeters: (json['area_radius_meters'] as num?)?.toInt(),
  airReading: json['air_reading'] == null
      ? null
      : AirReadingDTO.fromJson(json['air_reading'] as Map<String, dynamic>),
  photoPath: json['photo_path'] as String?,
  reportedByMe: json['reported_by_me'] as bool?,
);

Map<String, dynamic> _$IncidentDTOToJson(_IncidentDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'layer': instance.layer,
      'category': instance.category,
      'severity': instance.severity,
      'status': instance.status,
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'reported_at': instance.reportedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'confirmations': instance.confirmations,
      'area_radius_meters': instance.areaRadiusMeters,
      'air_reading': instance.airReading,
      'photo_path': instance.photoPath,
      'reported_by_me': instance.reportedByMe,
    };

_AirReadingDTO _$AirReadingDTOFromJson(Map<String, dynamic> json) =>
    _AirReadingDTO(
      indexLevel: (json['index_level'] as num?)?.toInt(),
      pm25: (json['pm25'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AirReadingDTOToJson(_AirReadingDTO instance) =>
    <String, dynamic>{
      'index_level': instance.indexLevel,
      'pm25': instance.pm25,
      'pm10': instance.pm10,
    };
