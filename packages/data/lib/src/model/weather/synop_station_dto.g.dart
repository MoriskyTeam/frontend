// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synop_station_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SynopStationDTO _$SynopStationDTOFromJson(Map<String, dynamic> json) =>
    _SynopStationDTO(
      stationId: (json['station_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SynopStationDTOToJson(_SynopStationDTO instance) =>
    <String, dynamic>{
      'station_id': instance.stationId,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };
