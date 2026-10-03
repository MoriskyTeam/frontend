// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_frames_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadarFramesDTO _$RadarFramesDTOFromJson(Map<String, dynamic> json) =>
    _RadarFramesDTO(
      past: (json['past'] as List<dynamic>?)
          ?.map((e) => RadarFrameDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RadarFramesDTOToJson(_RadarFramesDTO instance) =>
    <String, dynamic>{'past': instance.past};
