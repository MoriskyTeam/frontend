import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'danger_alarm.freezed.dart';

/// A danger alarm pushed to this device: a serious incident or an
/// operator's alert close to where the resident was last seen.
@freezed
sealed class DangerAlarm with _$DangerAlarm {
  const factory DangerAlarm({
    /// `incident:<id>` or `operator:<uuid>`; one alarm per source.
    required String sourceId,

    /// The incident to open on the map, null for a bare operator alert.
    required String? incidentId,
    required String title,
    required String body,
    required GeoPoint location,
  }) = _DangerAlarm;
}
