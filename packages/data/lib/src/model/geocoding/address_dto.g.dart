// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => _AddressDTO(
  road: json['road'] as String?,
  pedestrian: json['pedestrian'] as String?,
  houseNumber: json['house_number'] as String?,
  neighbourhood: json['neighbourhood'] as String?,
  quarter: json['quarter'] as String?,
  suburb: json['suburb'] as String?,
  cityDistrict: json['city_district'] as String?,
);

Map<String, dynamic> _$AddressDTOToJson(_AddressDTO instance) =>
    <String, dynamic>{
      'road': instance.road,
      'pedestrian': instance.pedestrian,
      'house_number': instance.houseNumber,
      'neighbourhood': instance.neighbourhood,
      'quarter': instance.quarter,
      'suburb': instance.suburb,
      'city_district': instance.cityDistrict,
    };
