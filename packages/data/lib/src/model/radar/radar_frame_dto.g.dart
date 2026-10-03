// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_frame_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadarFrameDTO _$RadarFrameDTOFromJson(Map<String, dynamic> json) =>
    _RadarFrameDTO(
      time: (json['time'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$RadarFrameDTOToJson(_RadarFrameDTO instance) =>
    <String, dynamic>{'time': instance.time, 'path': instance.path};
