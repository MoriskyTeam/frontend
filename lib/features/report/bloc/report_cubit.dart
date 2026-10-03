import 'dart:async';

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
  ReportCubit(this._getCurrentLocation, this._getAddress, this._submitReport)
    : super(const ReportState());

  /// Wait for the pin to settle before geocoding — also keeps us within
  /// Nominatim's one-request-per-second policy while the map is dragged.
  static const _addressDebounce = Duration(milliseconds: 800);

  final GetCurrentLocationUseCase _getCurrentLocation;
  final GetAddressUseCase _getAddress;
  final SubmitReportUseCase _submitReport;

  Timer? _addressTimer;

  Future<void> init() async {
    emit(state.copyWith(locationStatus: LoadingStatus.loading));
    final result = await _getCurrentLocation();
    result.fold(
      (_) => emit(state.copyWith(locationStatus: LoadingStatus.error)),
      (location) {
        emit(
          state.copyWith(
            locationStatus: LoadingStatus.loaded,
            location: location.point,
            locationIsFallback: location.isFallback,
          ),
        );
        unawaited(_resolveAddress(location.point));
      },
    );
  }

  void selectCategory(IncidentCategory category) =>
      emit(state.copyWith(category: category));

  void setDescription(String description) =>
      emit(state.copyWith(description: description));

  void setPhoto(String? photoPath) =>
      emit(state.copyWith(photoPath: photoPath));

  void movePin(GeoPoint point) {
    emit(
      state.copyWith(
        location: point,
        address: null,
        addressStatus: LoadingStatus.loading,
      ),
    );
    _addressTimer?.cancel();
    _addressTimer = Timer(
      _addressDebounce,
      () => unawaited(_resolveAddress(point)),
    );
  }

  Future<void> _resolveAddress(GeoPoint point) async {
    emit(state.copyWith(addressStatus: LoadingStatus.loading));
    final result = await _getAddress(point);
    // The pin may have moved again while the lookup was in flight.
    if (isClosed || state.location != point) return;
    result.fold(
      (_) => emit(
        state.copyWith(address: null, addressStatus: LoadingStatus.error),
      ),
      (address) => emit(
        state.copyWith(address: address, addressStatus: LoadingStatus.loaded),
      ),
    );
  }

  /// [title] is the headline shown on every map — the localised category
  /// name, which only the presentation layer can resolve.
  Future<void> submit({required String title}) async {
    final category = state.category;
    final location = state.location;
    if (category == null || location == null || state.submitStatus.isLoading) {
      return;
    }
    emit(state.copyWith(submitStatus: LoadingStatus.loading));
    final result = await _submitReport(
      SubmitReportRequest(
        category: category,
        title: title,
        location: location,
        address: state.address,
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

  @override
  Future<void> close() {
    _addressTimer?.cancel();
    return super.close();
  }
}
