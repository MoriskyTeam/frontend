import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_typography.dart';
import 'package:dynamic_rcb_alerts/features/map/model/incident_geo.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/incident_glyph.dart';
import 'package:dynamic_rcb_alerts/features/map/widget/proof_line.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/battenburg.dart';
import 'package:dynamic_rcb_alerts/shared/livery/chevrons.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_livery.dart';
import 'package:dynamic_rcb_alerts/shared/widgets/local_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Full read of one incident, shown in place of the nearby list.
class IncidentDetail extends StatelessWidget {
  const IncidentDetail({
    required this.incident,
    required this.origin,
    required this.now,
    required this.confirmedByMe,
    required this.onClose,
    required this.onConfirm,
    required this.scrollController,
    this.header,
    super.key,
  });

  final Incident incident;
  final GeoPoint origin;
  final DateTime now;
  final bool confirmedByMe;
  final VoidCallback onClose;
  final VoidCallback onConfirm;
  final ScrollController? scrollController;
  final Widget? header;

  bool get _confirmable =>
      incident.status != IncidentStatus.resolved &&
      !incident.reportedByMe &&
      (incident.layer == IncidentLayer.infrastructure ||
          incident.layer == IncidentLayer.neighbours);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final livery = incident.livery;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final distance = formatDistance(incident.distanceTo(origin), locale);
    final reading = incident.airReading;
    final photo = incident.photoPath;

    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      children: [
        ?header,
        Padding(
          padding: const EdgeInsets.fromLTRB(
            RcbSpacing.lg,
            0,
            RcbSpacing.xs,
            RcbSpacing.sm,
          ),
          child: Row(
            children: [
              Text(
                (reading != null
                        ? l10n.airStation
                        : incident.areaRadiusMeters != null
                        ? l10n.weatherWarning
                        : l10n.layer(incident.layer))
                    .toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: l10n.close,
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
        ),
        if (incident.severity.isHigh && reading == null)
          BattenburgBand(
            primary: livery.fill,
            secondary: livery.checker,
            cell: 8,
          )
        else
          Container(height: 6, color: livery.fill),
        Padding(
          padding: const EdgeInsets.all(RcbSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IncidentGlyph(incident: incident, size: 52),
                  const SizedBox(width: RcbSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (reading == null)
                          Row(
                            children: [
                              SeverityChevrons(
                                level: incident.severity.index + 1,
                                color: scheme.onSurface,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                l10n.severity(incident.severity).toUpperCase(),
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          )
                        else
                          Text(
                            l10n.airLevel(reading.level).toUpperCase(),
                            style: theme.textTheme.labelSmall,
                          ),
                        const SizedBox(height: RcbSpacing.xs),
                        Text(
                          l10n.titleOf(incident),
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: RcbSpacing.md),
              Text(
                '${l10n.addressOf(incident)}  ·  $distance',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFeatures: RcbTypography.tabular,
                ),
              ),
              const SizedBox(height: RcbSpacing.xs),
              ProofLine(incident: incident, now: now),
              if (reading != null) ...[
                const SizedBox(height: RcbSpacing.lg),
                _Readings(reading: reading),
              ],
              if (photo != null) ...[
                const SizedBox(height: RcbSpacing.lg),
                ClipRRect(
                  borderRadius: RcbRadii.cardBorder,
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: LocalImage(path: photo),
                  ),
                ),
              ],
              if (incident.description.isNotEmpty) ...[
                const SizedBox(height: RcbSpacing.lg),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    incident.description,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
              if (_confirmable || incident.confirmations > 0) ...[
                const SizedBox(height: RcbSpacing.lg),
                Text(
                  l10n.confirmations(incident.confirmations),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
              if (_confirmable) ...[
                const SizedBox(height: RcbSpacing.md),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: confirmedByMe
                        ? null
                        : () {
                            HapticFeedback.lightImpact();
                            onConfirm();
                          },
                    icon: Icon(
                      confirmedByMe
                          ? Icons.check_rounded
                          : Icons.visibility_outlined,
                    ),
                    label: Text(
                      confirmedByMe ? l10n.statusConfirmed : l10n.confirmAction,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: RcbSpacing.huge + RcbSpacing.xxl),
            ],
          ),
        ),
      ],
    );
  }
}

class _Readings extends StatelessWidget {
  const _Readings({required this.reading});

  final AirReading reading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    Widget cell(String label, double? value) => Expanded(
      child: Container(
        padding: const EdgeInsets.all(RcbSpacing.md),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: RcbRadii.cardBorder,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.labelMedium),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value?.round().toString() ?? '–',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontFeatures: RcbTypography.tabular,
                    ),
                  ),
                  TextSpan(
                    text: ' ${l10n.unitMicrograms}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            cell(l10n.pm25, reading.pm25),
            const SizedBox(width: RcbSpacing.sm),
            cell(l10n.pm10, reading.pm10),
          ],
        ),
        const SizedBox(height: RcbSpacing.sm),
        _AirScale(level: reading.level),
      ],
    );
  }
}

/// The GIOŚ scale with the current level marked, so the colour is read in
/// context rather than alone.
class _AirScale extends StatelessWidget {
  const _AirScale({required this.level});

  final AirQualityLevel level;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Semantics(
      label: l10n.airLevel(level),
      child: ExcludeSemantics(
        child: Row(
          children: [
            for (final step in AirQualityLevel.values)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Column(
                    children: [
                      Container(
                        height: step == level ? 12 : 6,
                        decoration: BoxDecoration(
                          color: step.livery.fill,
                          border: step == level
                              ? Border.all(color: RcbColors.asphalt, width: 1.5)
                              : null,
                        ),
                      ),
                      if (step == level)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.arrow_drop_up_rounded,
                            size: 18,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
