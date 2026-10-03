import 'package:freezed_annotation/freezed_annotation.dart';

part 'radar_frame.freezed.dart';

/// One precipitation radar snapshot as XYZ map tiles.
///
/// [tileUrlTemplate] carries `{z}`, `{x}` and `{y}` placeholders;
/// [maxNativeZoom] is the deepest zoom the source renders, the map upscales
/// past it.
@freezed
sealed class RadarFrame with _$RadarFrame {
  const factory RadarFrame({
    required String tileUrlTemplate,
    required DateTime time,
    required int maxNativeZoom,
  }) = _RadarFrame;
}
