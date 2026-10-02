import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'report_cubit.freezed.dart';
part 'report_event.dart';
part 'report_state.dart';

@injectable
class ReportCubit extends Cubit<ReportState>
    with BlocPresentationMixin<ReportState, ReportEvent> {
  ReportCubit(this._getCurrentLocation, this._submitReport)
    : super(const ReportState());

  final GetCurrentLocationUseCase _getCurrentLocation;
  final SubmitReportUseCase _submitReport;

  Future<void> init() async {
    emit(state.copyWith(locationStatus: LoadingStatus.loading));
    final result = await _getCurrentLocation();
    result.fold(
      (_) => emit(state.copyWith(locationStatus: LoadingStatus.error)),
      (location) => emit(
        state.copyWith(
          locationStatus: LoadingStatus.loaded,
          location: location.point,
          locationIsFallback: location.isFallback,
        ),
      ),
    );
  }

  void selectCategory(IncidentCategory category) =>
      emit(state.copyWith(category: category));

  void setDescription(String description) =>
      emit(state.copyWith(description: description));

  void setPhoto(String? photoPath) =>
      emit(state.copyWith(photoPath: photoPath));

  void movePin(GeoPoint point) => emit(state.copyWith(location: point));

  Future<void> submit() async {
    final category = state.category;
    final location = state.location;
    if (category == null || location == null || state.submitStatus.isLoading) {
      return;
    }
    emit(state.copyWith(submitStatus: LoadingStatus.loading));
    final result = await _submitReport(
      SubmitReportRequest(
        category: category,
        location: location,
        description: state.description.trim(),
        photoPath: state.photoPath,
      ),
    );
    result.fold(
      (error) {
        emit(state.copyWith(submitStatus: LoadingStatus.error));
        emitPresentation(ReportFailed(error));
      },
      (incident) {
        emit(state.copyWith(submitStatus: LoadingStatus.loaded));
        emitPresentation(ReportSubmitted(incident));
      },
    );
  }
}
