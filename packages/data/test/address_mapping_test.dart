import 'package:data/data.dart';
import 'package:test/test.dart';

AddressDTO _address({
  String? road,
  String? pedestrian,
  String? houseNumber,
  String? neighbourhood,
  String? suburb,
}) => AddressDTO(
  road: road,
  pedestrian: pedestrian,
  houseNumber: houseNumber,
  neighbourhood: neighbourhood,
  quarter: null,
  suburb: suburb,
  cityDistrict: null,
);

void main() {
  test(
    'GIVEN a Nominatim address,\n'
    'WHEN mapped,\n'
    'THEN street and number lead, the most local area follows',
    () {
      expect(
        _address(
          road: 'Grodzka',
          houseNumber: '5',
          suburb: 'Stare Miasto',
        ).toDomain(),
        'Grodzka 5, Stare Miasto',
      );
      expect(
        _address(pedestrian: 'Planty', neighbourhood: 'Kleparz').toDomain(),
        'Planty, Kleparz',
      );
      expect(_address().toDomain(), isNull);
    },
  );
}
