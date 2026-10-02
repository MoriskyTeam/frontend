import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_dto.freezed.dart';
part 'incident_dto.g.dart';

@freezed
sealed class IncidentDTO with _$IncidentDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory IncidentDTO({
    required String? id,
    required String? layer,
    required String? category,
    required String? severity,
    required String? status,
    required String? source,
    required String? title,
    required String? description,
    required String? address,
    required double? lat,
    required double? lng,
    required DateTime? reportedAt,
    required DateTime? updatedAt,
    required int? confirmations,
    required int? areaRadiusMeters,
    required AirReadingDTO? airReading,
    required String? photoPath,
    required bool? reportedByMe,
  }) = _IncidentDTO;

  factory IncidentDTO.fromJson(Map<String, dynamic> json) =>
      _$IncidentDTOFromJson(json);
}

@freezed
sealed class AirReadingDTO with _$AirReadingDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AirReadingDTO({
    required int? indexLevel,
    required double? pm25,
    required double? pm10,
  }) = _AirReadingDTO;

  factory AirReadingDTO.fromJson(Map<String, dynamic> json) =>
      _$AirReadingDTOFromJson(json);
}
