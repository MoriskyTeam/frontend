part of 'report_cubit.dart';

@freezed
sealed class ReportState with _$ReportState {
  const factory ReportState({
    @Default(null) IncidentCategory? category,
    @Default('') String description,
    @Default(null) String? photoPath,
    @Default(null) GeoPoint? location,
    @Default(true) bool locationIsFallback,

    /// Street address of the pin, resolved after it settles.
    @Default(null) String? address,
    @Default(LoadingStatus.initial) LoadingStatus addressStatus,
    @Default(LoadingStatus.initial) LoadingStatus locationStatus,
    @Default(LoadingStatus.initial) LoadingStatus submitStatus,

    /// The resident's own report being edited; null when filing a new one.
    /// [photoPath] then holds either its photo URL (unchanged) or a newly
    /// picked local file.
    @Default(null) Incident? editing,
  }) = _ReportState;
}
