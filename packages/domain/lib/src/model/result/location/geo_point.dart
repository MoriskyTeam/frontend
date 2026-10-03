import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_point.freezed.dart';

/// WGS84 coordinate. Kept framework-free so the domain never depends on a
/// map package.
@freezed
sealed class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required double latitude,
    required double longitude,
  }) = _GeoPoint;
}
