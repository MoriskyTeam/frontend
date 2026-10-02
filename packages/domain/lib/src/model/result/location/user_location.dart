import 'package:domain/src/model/result/location/geo_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';

/// Where the resident is. [isFallback] is true when the device position was
/// unavailable or outside the covered city and a demo anchor is used instead.
@freezed
sealed class UserLocation with _$UserLocation {
  const factory UserLocation({
    required GeoPoint point,
    required bool isFallback,
  }) = _UserLocation;
}
