import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Horizontal row of layer toggles, each tagged with its livery swatch and
/// how many active items it holds.
class LayerFilterBar extends StatelessWidget {
  const LayerFilterBar({
    required this.enabled,
    required this.counts,
    required this.onToggle,
    this.padding = EdgeInsets.zero,
    this.wrap = false,
    super.key,
  });

  final Set<IncidentLayer> enabled;
  final Map<IncidentLayer, int> counts;
  final ValueChanged<IncidentLayer> onToggle;
  final EdgeInsets padding;

  /// Wrap onto several lines instead of scrolling (wide side panel).
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    Widget chip(IncidentLayer layer) {
      final selected = enabled.contains(layer);
      final count = counts[layer] ?? 0;
      final labelColor = selected ? scheme.onSurface : scheme.onSurfaceVariant;
      return FilterChip(
        selected: selected,
        tooltip: l10n.layerCount(l10n.layer(layer), count),
        elevation: selected ? 2 : 0,
        shadowColor: scheme.shadow,
        backgroundColor: scheme.surfaceContainerHigh.withValues(
          alpha: 0.92,
        ),
        selectedColor: scheme.surfaceContainerLowest,
        side: BorderSide(
          color: selected ? scheme.onSurface : scheme.outlineVariant,
          width: selected ? 1.5 : 1,
        ),
        onSelected: (_) {
          HapticFeedback.selectionClick();
          onToggle(layer);
        },
        avatar: _Swatch(layer: layer, selected: selected),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.layer(layer)),
            const SizedBox(width: 6),
            Text(
              '$count',
              style: theme.textTheme.labelMedium?.copyWith(
                color: labelColor.withValues(alpha: 0.7),
                fontFeatures: RcbTypography.tabular,
              ),
            ),
          ],
        ),
        labelStyle: theme.textTheme.labelMedium?.copyWith(
          color: labelColor,
        ),
      );
    }

    if (wrap) {
      return Padding(
        padding: padding,
        child: Wrap(
          spacing: RcbSpacing.sm,
          runSpacing: RcbSpacing.sm,
          children: [for (final layer in IncidentLayer.values) chip(layer)],
        ),
      );
    }

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: IncidentLayer.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: RcbSpacing.sm),
        itemBuilder: (context, index) =>
            Center(child: chip(IncidentLayer.values[index])),
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
    final border = Border.all(color: RcbColors.asphalt);
    if (layer == IncidentLayer.airQuality) {
      // The air layer has no single livery: show the GIOŚ scale.
      return Opacity(
        opacity: selected ? 1 : 0.35,
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            borderRadius: RcbRadii.tightBorder,
            border: border,
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
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: selected ? livery.fill : Colors.transparent,
        borderRadius: RcbRadii.tightBorder,
        border: selected ? border : Border.all(color: livery.fill, width: 2),
      ),
    );
  }
}
