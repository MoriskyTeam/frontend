import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/model/map_view_data.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/incident_glyph.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/proof_line.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:dynamic_rcb_alerts/shared/livery/chevrons.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:dynamic_rcb_alerts/shared/livery/odblask_sweep.dart';
import 'package:flutter/material.dart';

/// "Closest to you": IMGW warnings, air now, the lead alert, then everything
/// else by distance. Rendered as slivers so it can live in the draggable
/// sheet or the wide-layout side panel.
class NearbyPanel extends StatelessWidget {
  const NearbyPanel({
    required this.data,
    required this.now,
    required this.arrivedIds,
    required this.allLayersOff,
    required this.loadFailed,
    required this.onRetry,
    required this.onSelect,
    required this.onEnableAllLayers,
    required this.scrollController,
    this.header,
    super.key,
  });

  final MapViewData data;
  final DateTime now;
  final Set<String> arrivedIds;
  final bool allLayersOff;

  /// The feed failed; shown instead of the (empty) list.
  final bool loadFailed;
  final VoidCallback onRetry;
  final ValueChanged<Incident> onSelect;
  final VoidCallback onEnableAllLayers;
  final ScrollController? scrollController;

  /// Extra content above the list (drag handle, filters on wide layouts).
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final hasAnything =
        data.warnings.isNotEmpty ||
        data.nearestStation != null ||
        data.lead != null ||
        data.active.isNotEmpty;

    String distanceOf(Incident incident) =>
        formatDistance(incident.distanceTo(data.origin), locale);

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        if (header case final header?) SliverToBoxAdapter(child: header),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            RcbSpacing.lg,
            RcbSpacing.xs,
            RcbSpacing.lg,
            RcbSpacing.md,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.nearbyTitle,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        if (loadFailed)
          SliverToBoxAdapter(
            child: _EmptyState(
              icon: Icons.cloud_off_rounded,
              title: l10n.offlineStatus,
              body: l10n.loadFailed,
              action: OutlinedButton(
                onPressed: onRetry,
                child: Text(l10n.retry),
              ),
            ),
          )
        else if (allLayersOff)
          SliverToBoxAdapter(
            child: _EmptyState(
              icon: Icons.layers_clear_rounded,
              title: l10n.allLayersOff,
              body: l10n.allLayersOffHint,
              action: OutlinedButton(
                onPressed: onEnableAllLayers,
                child: Text(l10n.enableAllLayers),
              ),
            ),
          )
        else ...[
          if (data.lead case final lead?)
            _padded(
              OdblaskSweep(
                active: arrivedIds.contains(lead.id),
                child: _LeadCard(
                  incident: lead,
                  distance: distanceOf(lead),
                  now: now,
                  onTap: () => onSelect(lead),
                ),
              ),
            ),
          for (final warning in data.warnings)
            _padded(
              OdblaskSweep(
                active: arrivedIds.contains(warning.id),
                child: _WarningStrip(
                  incident: warning,
                  now: now,
                  onTap: () => onSelect(warning),
                ),
              ),
            ),
          if (data.nearestStation case final station?)
            _padded(
              _AirNowRow(
                station: station,
                distance: distanceOf(station),
                onTap: () => onSelect(station),
              ),
            ),
          if (data.lead == null && data.active.isEmpty && hasAnything)
            SliverToBoxAdapter(
              child: _EmptyState(
                icon: Icons.verified_user_outlined,
                title: l10n.quietNearby,
              ),
            ),
          SliverList.separated(
            itemCount: data.active.length,
            separatorBuilder: (_, _) => const Divider(indent: 68),
            itemBuilder: (context, index) {
              final incident = data.active[index];
              return OdblaskSweep(
                active: arrivedIds.contains(incident.id),
                child: _IncidentRow(
                  incident: incident,
                  distance: distanceOf(incident),
                  now: now,
                  onTap: () => onSelect(incident),
                ),
              );
            },
          ),
          if (data.resolved.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                RcbSpacing.lg,
                RcbSpacing.xl,
                RcbSpacing.lg,
                RcbSpacing.xs,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.resolvedSection.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            SliverList.separated(
              itemCount: data.resolved.length,
              separatorBuilder: (_, _) => const Divider(indent: 68),
              itemBuilder: (context, index) {
                final incident = data.resolved[index];
                return _IncidentRow(
                  incident: incident,
                  distance: distanceOf(incident),
                  now: now,
                  onTap: () => onSelect(incident),
                );
              },
            ),
          ],
        ],
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            RcbSpacing.lg,
            RcbSpacing.xl,
            RcbSpacing.lg,
            RcbSpacing.huge + RcbSpacing.xxl,
          ),
          sliver: SliverToBoxAdapter(
            child: Text(
              l10n.mapAttribution,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _padded(Widget child) => SliverPadding(
    padding: const EdgeInsets.fromLTRB(
      RcbSpacing.lg,
      0,
      RcbSpacing.lg,
      RcbSpacing.md,
    ),
    sliver: SliverToBoxAdapter(child: child),
  );
}

class _WarningStrip extends StatelessWidget {
  const _WarningStrip({
    required this.incident,
    required this.now,
    required this.onTap,
  });

  final Incident incident;
  final DateTime now;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: RcbRadii.cardBorder,
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ChevronStripe(
              primary: RcbColors.signalRed,
              secondary: RcbColors.boneRaised,
            ),
            Padding(
              padding: const EdgeInsets.all(RcbSpacing.md),
              child: Row(
                children: [
                  Icon(
                    incident.category.icon,
                    color: RcbColors.signalRed,
                    size: 28,
                  ),
                  const SizedBox(width: RcbSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.titleOf(incident),
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          incident.address,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: RcbSpacing.xxs),
                        ProofLine(incident: incident, now: now),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AirNowRow extends StatelessWidget {
  const _AirNowRow({
    required this.station,
    required this.distance,
    required this.onTap,
  });

  final Incident station;
  final String distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final reading = station.airReading!;
    final muted = theme.colorScheme.onSurfaceVariant;
    final pm25 = reading.pm25?.round();

    return Material(
      color: theme.colorScheme.surfaceContainerHigh,
      borderRadius: RcbRadii.cardBorder,
      child: InkWell(
        onTap: onTap,
        borderRadius: RcbRadii.cardBorder,
        child: Padding(
          padding: const EdgeInsets.all(RcbSpacing.md),
          child: Row(
            children: [
              IncidentGlyph(incident: station, size: 44),
              const SizedBox(width: RcbSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${l10n.airNow}: ${l10n.airLevel(reading.level)}',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      [
                        if (pm25 != null)
                          '${l10n.pm25} $pm25 ${l10n.unitMicrograms}',
                        station.address,
                        distance,
                      ].join('  ·  '),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: muted,
                        fontFeatures: RcbTypography.tabular,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: muted),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeadCard extends StatelessWidget {
  const _LeadCard({
    required this.incident,
    required this.distance,
    required this.now,
    required this.onTap,
  });

  final Incident incident;
  final String distance;
  final DateTime now;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final livery = incident.livery;
    final high = incident.severity.isHigh;

    return Material(
      color: theme.colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: RcbRadii.cardBorder,
        side: BorderSide(
          color: high ? RcbColors.asphalt : theme.colorScheme.outlineVariant,
          width: high ? 1.5 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (high)
              BattenburgBand(primary: livery.fill, secondary: livery.checker)
            else
              Container(height: 6, color: livery.fill),
            Padding(
              padding: const EdgeInsets.all(RcbSpacing.lg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IncidentGlyph(incident: incident, size: 48),
                  const SizedBox(width: RcbSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.titleOf(incident),
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: RcbSpacing.xxs),
                        SeverityBadge(
                          level: incident.severity.index + 1,
                          label: l10n.severity(incident.severity),
                        ),
                        const SizedBox(height: RcbSpacing.xxs),
                        Text(
                          '${l10n.addressOf(incident)}  ·  $distance',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFeatures: RcbTypography.tabular,
                          ),
                        ),
                        const SizedBox(height: RcbSpacing.sm),
                        ProofLine(incident: incident, now: now),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IncidentRow extends StatelessWidget {
  const _IncidentRow({
    required this.incident,
    required this.distance,
    required this.now,
    required this.onTap,
  });

  final Incident incident;
  final String distance;
  final DateTime now;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final resolved = incident.status == IncidentStatus.resolved;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: RcbSpacing.lg,
          vertical: RcbSpacing.md,
        ),
        child: Row(
          children: [
            IncidentGlyph(incident: incident),
            const SizedBox(width: RcbSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.titleOf(incident),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: resolved
                                ? theme.colorScheme.onSurfaceVariant
                                : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: RcbSpacing.sm),
                      Text(
                        distance,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontFeatures: RcbTypography.tabular,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    l10n.addressOf(incident),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: RcbSpacing.xxs),
                  ProofLine(incident: incident, now: now),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    this.body,
    this.action,
  });

  final IconData icon;
  final String title;
  final String? body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RcbSpacing.lg,
        RcbSpacing.sm,
        RcbSpacing.lg,
        RcbSpacing.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: RcbSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                if (body case final body?) ...[
                  const SizedBox(height: RcbSpacing.xxs),
                  Text(body, style: theme.textTheme.bodyMedium),
                ],
                if (action case final action?) ...[
                  const SizedBox(height: RcbSpacing.md),
                  action,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
