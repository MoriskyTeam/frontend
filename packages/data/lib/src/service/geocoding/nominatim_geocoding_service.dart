import 'dart:convert';

import 'package:data/src/model/geocoding/address_dto.dart';
import 'package:data/src/service/geocoding/geocoding_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

/// OpenStreetMap Nominatim — no key, but its usage policy asks for an
/// identifying User-Agent (browsers send their own plus a Referer) and at
/// most one request per second, which the report form's debounce respects.
@Injectable(as: GeocodingService)
class NominatimGeocodingService implements GeocodingService {
  static const _host = 'nominatim.openstreetmap.org';
  static const _timeout = Duration(seconds: 6);

  @override
  Future<AddressDTO?> reverse({
    required double lat,
    required double lng,
  }) async {
    final uri = Uri.https(_host, '/reverse', {
      'format': 'jsonv2',
      'lat': '$lat',
      'lon': '$lng',
      'zoom': '18',
      'addressdetails': '1',
      'accept-language': 'pl',
    });
    final response = await http
        .get(
          uri,
          headers: {
            if (!kIsWeb)
              'User-Agent': 'CityShield/0.1 (dev.slavis.dynamicrcbalerts)',
          },
        )
        .timeout(_timeout);
    if (response.statusCode != 200) {
      throw http.ClientException('Nominatim ${response.statusCode}', uri);
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final address = json['address'];
    return address is Map<String, dynamic>
        ? AddressDTO.fromJson(address)
        : null;
  }
}
