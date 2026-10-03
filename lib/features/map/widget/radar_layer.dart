import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// RainViewer precipitation radar, laid thin over the neutral basemap.
///
/// The source stops at a coarse zoom, so over the city the tiles are
/// upscaled into soft rain blooms rather than crisp cells.
class RadarLayer extends StatelessWidget {
  const RadarLayer({required this.frame, super.key});

  final RadarFrame frame;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return IgnorePointer(
      child: Opacity(
        opacity: dark ? 0.6 : 0.5,
        child: TileLayer(
          // A new frame swaps tiles without flashing the old ones out.
          key: ValueKey(frame.tileUrlTemplate),
          urlTemplate: frame.tileUrlTemplate,
          maxNativeZoom: frame.maxNativeZoom,
          userAgentPackageName: 'dev.slavis.dynamicrcbalerts',
          evictErrorTileStrategy: EvictErrorTileStrategy.dispose,
        ),
      ),
    );
  }
}
