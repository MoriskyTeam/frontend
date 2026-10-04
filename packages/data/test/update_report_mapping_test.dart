import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

UpdateReportRequest _request(ReportPhoto photo) => UpdateReportRequest(
  incidentId: 'res-1',
  category: IncidentCategory.flooding,
  title: 'Podtopienie',
  description: 'Woda po kostki',
  photo: photo,
  previousPhotoUrl:
      'https://x.supabase.co/storage/v1/object/public/report-photos/u1/a.jpg',
);

void main() {
  test(
    'GIVEN an edit that keeps, replaces or drops the photo,\n'
    'WHEN mapped for update_my_report,\n'
    'THEN exactly the matching photo field is set',
    () {
      final keep = _request(
        const ReportPhoto.keep(url: 'https://a/b.jpg'),
      ).toData();
      expect(keep.keepPhotoUrl, 'https://a/b.jpg');
      expect(keep.newPhotoPath, isNull);

      final replace = _request(
        const ReportPhoto.replace(localPath: '/tmp/new.jpg'),
      ).toData();
      expect(replace.keepPhotoUrl, isNull);
      expect(replace.newPhotoPath, '/tmp/new.jpg');

      final none = _request(const ReportPhoto.none()).toData();
      expect(none.keepPhotoUrl, isNull);
      expect(none.newPhotoPath, isNull);
      expect(none.category, 'flooding');
    },
  );

  test(
    'GIVEN the public URL of a report photo,\n'
    'WHEN turned into a storage path,\n'
    'THEN it is the object inside the report-photos bucket',
    () {
      expect(
        'https://x.supabase.co/storage/v1/object/public/report-photos/'
                'u1/a%20b.jpg?t=1'
            .toReportPhotoObjectPath(),
        'u1/a b.jpg',
      );
      expect('https://example.com/photo.jpg'.toReportPhotoObjectPath(), isNull);
    },
  );
}
