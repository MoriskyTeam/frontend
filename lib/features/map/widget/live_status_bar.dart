import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/brand_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Top bar: wordmark, live state, and the one-line answer to "is anything
/// happening around me?".
class LiveStatusBar extends StatelessWidget {
  const LiveStatusBar({
    required this.activeNearby,
    required this.locationLabel,
    required this.offline,
    super.key,
  });

  final int activeNearby;
  final String locationLabel;

  /// The feed failed: never claim "calm" or "live" without data.
  final bool offline;

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
                if (!offline) const _LivePill(),
              ],
            ),
            const SizedBox(height: RcbSpacing.xs),
            if (offline)
              Semantics(
                liveRegion: true,
                child: Row(
                  children: [
                    Icon(
                      Icons.cloud_off_rounded,
                      size: 20,
                      color: scheme.error,
                    ),
                    const SizedBox(width: RcbSpacing.sm),
                    Flexible(
                      child: Text(
                        l10n.offlineStatus,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              )
            else
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

class _LivePill extends HookWidget {
  const _LivePill();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final blink = useAnimationController(
      duration: const Duration(milliseconds: 1400),
    );
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    useEffect(() {
      if (reduceMotion) {
        blink.value = 1;
      } else {
        blink.repeat(reverse: true);
      }
      return null;
    }, [reduceMotion]);
    final opacity = useMemoized(
      () => Tween<double>(begin: 0.25, end: 1).animate(blink),
      [blink],
    );

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
            opacity: opacity,
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
