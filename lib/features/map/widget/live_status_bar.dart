import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/brand_mark.dart';
import 'package:flutter/material.dart';

/// Top bar: wordmark, live state, and the one-line answer to "is anything
/// happening around me?".
class LiveStatusBar extends StatelessWidget {
  const LiveStatusBar({
    required this.activeNearby,
    required this.locationLabel,
    super.key,
  });

  final int activeNearby;
  final String locationLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: RcbRadii.cardBorder,
        border: Border.all(color: scheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow,
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          RcbSpacing.md,
          RcbSpacing.sm,
          RcbSpacing.sm,
          RcbSpacing.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BrandMark(name: l10n.appTitle),
                const Spacer(),
                const _LivePill(),
                const SizedBox(width: RcbSpacing.xs),
                Tooltip(
                  message: l10n.demoDataNote,
                  triggerMode: TooltipTriggerMode.tap,
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: RcbSpacing.sm,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: RcbRadii.tightBorder,
                      border: Border.all(color: scheme.outline),
                    ),
                    child: Text(
                      l10n.demoBadge,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: RcbSpacing.xs),
            Semantics(
              liveRegion: true,
              label: l10n.activeNearby(activeNearby),
              excludeSemantics: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  if (activeNearby > 0) ...[
                    Text(
                      '$activeNearby',
                      style: theme.textTheme.displaySmall?.copyWith(
                        height: 1,
                        fontWeight: FontWeight.w800,
                        fontFeatures: RcbTypography.tabular,
                      ),
                    ),
                    const SizedBox(width: RcbSpacing.sm),
                  ],
                  Flexible(
                    child: Text(
                      l10n.activeNearbyLabel(activeNearby),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              locationLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _LivePill extends StatefulWidget {
  const _LivePill();

  @override
  State<_LivePill> createState() => _LivePillState();
}

class _LivePillState extends State<_LivePill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _blink = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _blink.value = 1;
    } else if (!_blink.isAnimating) {
      _blink.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _blink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: RcbSpacing.sm),
      decoration: BoxDecoration(
        color: RcbColors.hiVis,
        borderRadius: RcbRadii.tightBorder,
        border: Border.all(color: RcbColors.asphalt),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: Tween<double>(begin: 0.25, end: 1).animate(_blink),
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: RcbColors.asphalt,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            l10n.liveBadge,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: RcbColors.asphalt,
            ),
          ),
        ],
      ),
    );
  }
}
