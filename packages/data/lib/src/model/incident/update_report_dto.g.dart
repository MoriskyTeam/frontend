// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateReportDTO _$UpdateReportDTOFromJson(Map<String, dynamic> json) =>
    _UpdateReportDTO(
      id: json['id'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      keepPhotoUrl: json['keep_photo_url'] as String?,
      newPhotoPath: json['new_photo_path'] as String?,
      previousPhotoUrl: json['previous_photo_url'] as String?,
    );

Map<String, dynamic> _$UpdateReportDTOToJson(_UpdateReportDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'keep_photo_url': instance.keepPhotoUrl,
      'new_photo_path': instance.newPhotoPath,
      'previous_photo_url': instance.previousPhotoUrl,
    };
