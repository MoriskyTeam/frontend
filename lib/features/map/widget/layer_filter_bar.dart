import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The four layer toggles in one equal-width row, so every layer stays
/// visible on a 360 dp phone. Each carries its livery swatch and how many
/// active items it holds.
class LayerFilterBar extends StatelessWidget {
  const LayerFilterBar({
    required this.enabled,
    required this.counts,
    required this.onToggle,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  /// The brief's three layers first, weather warnings last.
  static const List<IncidentLayer> order = [
    IncidentLayer.infrastructure,
    IncidentLayer.airQuality,
    IncidentLayer.neighbours,
    IncidentLayer.weather,
  ];

  final Set<IncidentLayer> enabled;
  final Map<IncidentLayer, int> counts;
  final ValueChanged<IncidentLayer> onToggle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          for (final (index, layer) in order.indexed) ...[
            if (index > 0) const SizedBox(width: RcbSpacing.xs + 2),
            Expanded(
              child: _LayerChip(
                layer: layer,
                selected: enabled.contains(layer),
                count: counts[layer] ?? 0,
                onTap: () {
                  HapticFeedback.selectionClick();
                  onToggle(layer);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LayerChip extends StatelessWidget {
  const _LayerChip({
    required this.layer,
    required this.selected,
    required this.count,
    required this.onTap,
  });

  final IncidentLayer layer;
  final bool selected;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final labelColor = selected ? scheme.onSurface : scheme.onSurfaceVariant;

    return Semantics(
      button: true,
      toggled: selected,
      label: l10n.layerCount(l10n.layer(layer), count),
      excludeSemantics: true,
      child: SizedBox(
        height: 48,
        child: Center(
          child: Material(
            color: selected
                ? scheme.surface
                : scheme.surfaceContainerHigh.withValues(alpha: 0.92),
            elevation: selected ? 2 : 0,
            shadowColor: scheme.shadow,
            shape: RoundedRectangleBorder(
              borderRadius: RcbRadii.buttonBorder,
              side: BorderSide(
                color: selected ? scheme.onSurface : scheme.outlineVariant,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: RcbRadii.buttonBorder,
              child: SizedBox(
                height: 38,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _Swatch(layer: layer, selected: selected),
                        const SizedBox(width: 5),
                        Text(
                          l10n.layer(layer),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: labelColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$count',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: labelColor.withValues(alpha: 0.7),
                            fontFeatures: RcbTypography.tabular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.layer, required this.selected});

  final IncidentLayer layer;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final livery = layer.livery;
    if (layer == IncidentLayer.airQuality) {
      // The air layer has no single livery: show the GIOŚ scale.
      return Opacity(
        opacity: selected ? 1 : 0.35,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: RcbRadii.tightBorder,
            border: Border.all(color: RcbColors.asphalt),
            gradient: const LinearGradient(
              colors: [
                RcbColors.airVeryGood,
                RcbColors.airModerate,
                RcbColors.airBad,
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: selected ? livery.fill : Colors.transparent,
        borderRadius: RcbRadii.tightBorder,
        border: selected
            ? Border.all(color: RcbColors.asphalt)
            : Border.all(color: livery.fill, width: 2),
      ),
    );
  }
}
