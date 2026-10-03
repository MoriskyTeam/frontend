part of 'report_cubit.dart';

@freezed
sealed class ReportState with _$ReportState {
  const factory ReportState({
    @Default(null) IncidentCategory? category,
    @Default('') String description,
    @Default(null) String? photoPath,
    @Default(null) GeoPoint? location,
    @Default(true) bool locationIsFallback,
    @Default(LoadingStatus.initial) LoadingStatus locationStatus,
    @Default(LoadingStatus.initial) LoadingStatus submitStatus,
  }) = _ReportState;
}
