// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitReportDTO _$SubmitReportDTOFromJson(Map<String, dynamic> json) =>
    _SubmitReportDTO(
      category: json['category'] as String?,
      title: json['title'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      description: json['description'] as String?,
      photoPath: json['photo_path'] as String?,
    );

Map<String, dynamic> _$SubmitReportDTOToJson(_SubmitReportDTO instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'description': instance.description,
      'photo_path': instance.photoPath,
    };
