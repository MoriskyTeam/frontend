import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// OpenStreetMap raster tiles pushed into the Odblask neutral scale.
///
/// The basemap must never compete with livery colours, so tiles are
/// desaturated and their contrast compressed towards road-bone (light) or
/// inverted towards asphalt (dark). No API key needed.
class NeutralTileLayer extends StatelessWidget {
  const NeutralTileLayer({super.key});

  // Luminance weights.
  static const _r = 0.2126;
  static const _g = 0.7152;
  static const _b = 0.0722;

  static ColorFilter _grey({
    required double gain,
    required List<double> offsets,
  }) => ColorFilter.matrix([
    for (final offset in offsets) ...[
      _r * gain,
      _g * gain,
      _b * gain,
      0,
      offset,
    ],
    0,
    0,
    0,
    1,
    0,
  ]);

  static ColorFilter _light() => _grey(gain: 0.6, offsets: const [97, 98, 94]);

  static ColorFilter _dark() =>
      _grey(gain: -0.62, offsets: const [186, 189, 192]);

  @override
  Widget build(BuildContext context) {
    final filter = Theme.of(context).brightness == Brightness.dark
        ? _dark()
        : _light();
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.slavis.dynamicrcbalerts',
      tileBuilder: (context, tile, _) =>
          ColorFiltered(colorFilter: filter, child: tile),
    );
  }
}
