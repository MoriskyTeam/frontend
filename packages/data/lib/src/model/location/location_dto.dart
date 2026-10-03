import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
sealed class LocationDTO with _$LocationDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LocationDTO({
    required double? lat,
    required double? lng,
    required bool? isFallback,
  }) = _LocationDTO;

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);
}
