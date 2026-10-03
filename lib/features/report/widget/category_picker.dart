import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Grid of reportable categories. One tap, no dropdown.
class CategoryPicker extends StatelessWidget {
  const CategoryPicker({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final IncidentCategory? selected;
  final ValueChanged<IncidentCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 520 ? 8 : 4;
        const gap = RcbSpacing.sm;
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final category in IncidentCategory.reportable)
              SizedBox(
                width: width,
                height: 88,
                child: _CategoryTile(
                  label: l10n.category(category),
                  icon: category.icon,
                  selected: category == selected,
                  scheme: scheme,
                  textTheme: theme.textTheme,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onSelected(category);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.scheme,
    required this.textTheme,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final ColorScheme scheme;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? scheme.onInverseSurface : scheme.onSurface;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? scheme.inverseSurface : scheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: RcbRadii.cardBorder,
          side: BorderSide(
            color: selected ? scheme.inverseSurface : scheme.outlineVariant,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: RcbRadii.cardBorder,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: RcbSpacing.xs,
              vertical: RcbSpacing.sm,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 26,
                  color: selected ? RcbColors.hiVis : foreground,
                ),
                const SizedBox(height: RcbSpacing.xs),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelMedium?.copyWith(
                    color: foreground,
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
