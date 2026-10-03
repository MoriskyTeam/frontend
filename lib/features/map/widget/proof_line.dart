import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:dynamic_rcb_alerts/shared/livery/incident_labels.dart';
import 'package:dynamic_rcb_alerts/shared/livery/status_mark.dart';
import 'package:flutter/material.dart';

/// Status mark, status, source and age — the proof every alert carries.
class ProofLine extends StatelessWidget {
  const ProofLine({required this.incident, required this.now, super.key});

  final Incident incident;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final style = theme.textTheme.bodySmall?.copyWith(color: muted);
    final resolved = incident.status == IncidentStatus.resolved;
    // Station readings and weather warnings have no report lifecycle.
    final hasLifecycle =
        incident.airReading == null &&
        incident.weatherReading == null &&
        incident.areaRadiusMeters == null;

    return Row(
      children: [
        if (hasLifecycle) ...[
          StatusMark(
            status: incident.status,
            color: theme.colorScheme.onSurface,
          ),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                if (hasLifecycle) ...[
                  TextSpan(
                    text: l10n.status(incident.status),
                    style: style?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      decoration: resolved ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const TextSpan(text: '  ·  '),
                ],
                TextSpan(text: l10n.source(incident.source)),
                TextSpan(
                  text: '  ·  ${l10n.ago(incident.reportedAt, now: now)}',
                ),
              ],
            ),
            style: style,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
