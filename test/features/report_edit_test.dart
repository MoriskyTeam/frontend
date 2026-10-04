import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:dynamic_rcb_alerts/features/map/bloc/map_cubit.dart';
import 'package:dynamic_rcb_alerts/features/report/bloc/report_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

/// Any repository call the test does not expect fails loudly.
class _Repo implements IncidentRepository, LocationRepository {
  _Repo({this.failDelete = false});

  final bool failDelete;
  UpdateReportRequest? updated;
  String? deletedId;

  @override
  Future<Incident> updateReport({required UpdateReportRequest request}) async {
    updated = request;
    return _mine.copyWith(
      category: request.category,
      description: request.description,
    );
  }

  @override
  Future<void> deleteReport({
    required String incidentId,
    String? photoUrl,
  }) async {
    if (failDelete) throw StateError('offline');
    deletedId = incidentId;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Unused implements AlarmRepository, AuthRepository, RadarRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _photo =
    'https://x.supabase.co/storage/v1/object/public/report-photos/u1/a.jpg';

final _mine = Incident(
  id: 'res-1',
  layer: IncidentLayer.neighbours,
  category: IncidentCategory.flooding,
  severity: IncidentSeverity.medium,
  status: IncidentStatus.reported,
  source: IncidentSource.resident,
  title: 'Podtopienie',
  description: 'Woda po kostki',
  address: 'Grodzka 5',
  location: const GeoPoint(latitude: 50.06, longitude: 19.94),
  reportedAt: DateTime(2026),
  updatedAt: null,
  confirmations: 2,
  areaRadiusMeters: null,
  airReading: null,
  weatherReading: null,
  photoPath: _photo,
  reportedByMe: true,
);

ReportCubit _reportCubit(_Repo repo) => ReportCubit(
  GetCurrentLocationUseCase(repo),
  GetAddressUseCase(repo),
  SubmitReportUseCase(repo),
  UpdateReportUseCase(repo),
);

MapCubit _mapCubit(_Repo repo) => MapCubit(
  WatchIncidentsUseCase(repo),
  GetCurrentLocationUseCase(repo),
  ConfirmIncidentUseCase(repo),
  EnsureSignedInUseCase(_Unused()),
  GetLatestRadarFrameUseCase(_Unused()),
  RegisterPushDeviceUseCase(_Unused()),
  DeleteReportUseCase(repo),
);

void main() {
  test(
    'GIVEN the resident opens their own report for editing,\n'
    'WHEN the form loads,\n'
    'THEN it holds the report as it is, at its fixed place',
    () {
      final cubit = _reportCubit(_Repo())..initEdit(_mine);

      expect(cubit.state.editing, _mine);
      expect(cubit.state.category, IncidentCategory.flooding);
      expect(cubit.state.description, 'Woda po kostki');
      expect(cubit.state.photoPath, _photo);
      expect(cubit.state.location, _mine.location);
      expect(cubit.state.address, 'Grodzka 5');
    },
  );

  for (final (name, photo, expected) in [
    ('keeps the photo', _photo, const ReportPhoto.keep(url: _photo)),
    (
      'replaces the photo',
      '/tmp/new.jpg',
      const ReportPhoto.replace(localPath: '/tmp/new.jpg'),
    ),
    ('drops the photo', null, const ReportPhoto.none()),
  ]) {
    test(
      'GIVEN an edit that $name,\n'
      'WHEN saved,\n'
      'THEN the update carries that photo change and the old photo URL',
      () async {
        final repo = _Repo();
        final cubit = _reportCubit(repo)
          ..initEdit(_mine)
          ..selectCategory(IncidentCategory.road)
          ..setDescription('  Zalana jezdnia  ')
          ..setPhoto(photo);

        await cubit.submit(title: 'Droga');

        expect(repo.updated?.incidentId, 'res-1');
        expect(repo.updated?.category, IncidentCategory.road);
        expect(repo.updated?.description, 'Zalana jezdnia');
        expect(repo.updated?.photo, expected);
        expect(repo.updated?.previousPhotoUrl, _photo);
        expect(cubit.state.submitStatus, LoadingStatus.loaded);
      },
    );
  }

  blocTest<MapCubit, MapState>(
    'GIVEN the resident deletes their selected report,\n'
    'WHEN the server accepts,\n'
    'THEN it leaves the map at once and the selection clears',
    build: () => _mapCubit(_Repo()),
    seed: () => MapState(incidents: [_mine], selectedIncidentId: 'res-1'),
    act: (cubit) => cubit.deleteReport(_mine),
    expect: () => [const MapState()],
  );

  blocTest<MapCubit, MapState>(
    'GIVEN the resident deletes their report,\n'
    'WHEN the server refuses,\n'
    'THEN it comes back on the map',
    build: () => _mapCubit(_Repo(failDelete: true)),
    seed: () => MapState(incidents: [_mine]),
    act: (cubit) => cubit.deleteReport(_mine),
    expect: () => [
      const MapState(),
      MapState(incidents: [_mine]),
    ],
  );
}
