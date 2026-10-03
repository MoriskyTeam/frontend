import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dynamic_rcb_alerts/core/di/injection.dart';
import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:dynamic_rcb_alerts/features/report/bloc/report_cubit.dart';
import 'package:dynamic_rcb_alerts/features/report/widget/category_picker.dart';
import 'package:dynamic_rcb_alerts/features/report/widget/location_picker.dart';
import 'package:dynamic_rcb_alerts/features/report/widget/photo_field.dart';
import 'package:dynamic_rcb_alerts/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Quick report: what, photo, where, optional note. Pops with the created
/// incident.
class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<ReportCubit>();
        unawaited(cubit.init());
        return cubit;
      },
      child: const _ReportPageCore(),
    );
  }
}

class _ReportPageCore extends StatelessWidget {
  const _ReportPageCore();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocPresentationListener<ReportCubit, ReportEvent>(
      listener: (context, event) {
        switch (event) {
          case ReportSubmitted(:final incident):
            unawaited(HapticFeedback.mediumImpact());
            context.pop(incident);
          case ReportFailed():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.reportFailed),
                action: SnackBarAction(
                  label: l10n.retry,
                  onPressed: context.read<ReportCubit>().submit,
                ),
              ),
            );
        }
      },
      child: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) => _ReportPageBody(state: state),
      ),
    );
  }
}

class _ReportPageBody extends StatelessWidget {
  const _ReportPageBody({required this.state});

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final cubit = context.read<ReportCubit>();
    final sending = state.submitStatus.isLoading;
    final canSend =
        state.category != null && state.location != null && !sending;

    Widget section(String title, Widget child) => Padding(
      padding: const EdgeInsets.only(bottom: RcbSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: RcbSpacing.md),
          child,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: l10n.close,
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.reportTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: scheme.outlineVariant),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              RcbSpacing.lg,
              RcbSpacing.xl,
              RcbSpacing.lg,
              RcbSpacing.xl,
            ),
            children: [
              section(
                l10n.reportWhat,
                CategoryPicker(
                  selected: state.category,
                  onSelected: cubit.selectCategory,
                ),
              ),
              section(
                l10n.reportPhoto,
                PhotoField(
                  photoPath: state.photoPath,
                  onChanged: cubit.setPhoto,
                ),
              ),
              section(
                l10n.reportWhere,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.location case final location?)
                      LocationPicker(
                        initial: location,
                        onMoved: cubit.movePin,
                      )
                    else
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: scheme.surfaceContainerHigh,
                          borderRadius: RcbRadii.cardBorder,
                        ),
                      ),
                    const SizedBox(height: RcbSpacing.sm),
                    Text(
                      [
                        if (state.locationIsFallback)
                          l10n.locationDemo
                        else
                          l10n.locationDevice,
                        l10n.reportWhereHint,
                      ].join('  ·  '),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              section(
                l10n.reportNote,
                TextField(
                  onChanged: cubit.setDescription,
                  maxLength: 140,
                  minLines: 2,
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(hintText: l10n.reportNoteHint),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.surface,
          border: Border(top: BorderSide(color: scheme.outlineVariant)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              RcbSpacing.lg,
              RcbSpacing.md,
              RcbSpacing.lg,
              RcbSpacing.md,
            ),
            child: Center(
              heightFactor: 1,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 608),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.category == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: RcbSpacing.sm),
                        child: Text(
                          l10n.reportPickCategoryFirst,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    FilledButton(
                      onPressed: canSend ? cubit.submit : null,
                      child: sending
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox.square(
                                  dimension: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: scheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(width: RcbSpacing.md),
                                Text(l10n.reportSending.toUpperCase()),
                              ],
                            )
                          : Text(l10n.reportSubmit.toUpperCase()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
