import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

/// The `address` object of a Nominatim reverse-geocoding response.
@freezed
sealed class AddressDTO with _$AddressDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AddressDTO({
    required String? road,
    required String? pedestrian,
    required String? houseNumber,
    required String? neighbourhood,
    required String? quarter,
    required String? suburb,
    required String? cityDistrict,
  }) = _AddressDTO;

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);
}
