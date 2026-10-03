import 'package:data/src/model/weather/synop_reading_dto.dart';
import 'package:data/src/model/weather/synop_station_dto.dart';
import 'package:data/src/service/weather/weather_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// IMGW synoptic stations and their latest observation from the
/// `imgw_synop_stations` and `imgw_synop_readings` tables, joined on
/// `station_id`.
@LazySingleton(as: WeatherService)
class SupabaseWeatherService implements WeatherService {
  SupabaseWeatherService(this._client);

  static const _stationsTable = 'imgw_synop_stations';
  static const _readingsTable = 'imgw_synop_readings';

  final SupabaseClient _client;

  /// Stations are fixed metadata and their table is not in the Realtime
  /// publication, so they are read once; readings stay live.
  @override
  Stream<List<SynopStationDTO>> watchStations() => Stream.fromFuture(
    _client
        .from(_stationsTable)
        .select()
        .then(
          (rows) => [for (final row in rows) SynopStationDTO.fromJson(row)],
        ),
  );

  @override
  Stream<List<SynopReadingDTO>> watchReadings() => _client
      .from(_readingsTable)
      .stream(primaryKey: ['station_id'])
      .map((rows) => [for (final row in rows) SynopReadingDTO.fromJson(row)]);
}
