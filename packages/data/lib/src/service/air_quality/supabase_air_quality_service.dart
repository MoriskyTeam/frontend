import 'package:data/src/model/air_quality/gios_reading_dto.dart';
import 'package:data/src/model/air_quality/gios_station_dto.dart';
import 'package:data/src/service/air_quality/air_quality_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// GIOŚ stations and their latest PM readings from the `gios_stations` and
/// `gios_readings` tables, kept live through Supabase Realtime. Readable by
/// the signed-in (anonymous) resident. Schema: `docs/supabase_contract.md`.
@LazySingleton(as: AirQualityService)
class SupabaseAirQualityService implements AirQualityService {
  SupabaseAirQualityService(this._client);

  static const _stationsTable = 'gios_stations';
  static const _readingsTable = 'gios_readings';

  final SupabaseClient _client;

  @override
  Stream<List<GiosStationDTO>> watchStations() => _client
      .from(_stationsTable)
      .stream(primaryKey: ['station_id'])
      .map((rows) => [for (final row in rows) GiosStationDTO.fromJson(row)]);

  @override
  Stream<List<GiosReadingDTO>> watchReadings() => _client
      .from(_readingsTable)
      .stream(primaryKey: ['sensor_id'])
      .map((rows) => [for (final row in rows) GiosReadingDTO.fromJson(row)]);
}
