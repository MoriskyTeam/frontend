import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' show ClientException;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('SupabaseErrorMapper', () {
    test(
      'GIVEN Postgres error codes,\n'
      'WHEN mapped,\n'
      'THEN they land on the matching ApiErrorKind',
      () {
        ApiErrorKind kindOf(String code) =>
            PostgrestException(message: 'x', code: code).toApiException().kind;

        expect(kindOf('42501'), ApiErrorKind.forbidden);
        expect(kindOf('23505'), ApiErrorKind.conflict);
        expect(kindOf('23502'), ApiErrorKind.validation);
        expect(kindOf('PGRST116'), ApiErrorKind.notFound);
        expect(kindOf('PT400'), ApiErrorKind.validation);
        expect(kindOf('PT401'), ApiErrorKind.unauthorized);
        expect(kindOf('PT404'), ApiErrorKind.notFound);
        expect(kindOf('401'), ApiErrorKind.unauthorized);
        expect(kindOf('503'), ApiErrorKind.server);
      },
    );

    test('maps auth and storage HTTP statuses', () {
      expect(
        const AuthException('x', statusCode: '401').toApiException().kind,
        ApiErrorKind.unauthorized,
      );
      expect(
        const StorageException('x', statusCode: '403').toApiException().kind,
        ApiErrorKind.forbidden,
      );
    });

    test('maps transport failures to network', () {
      expect(
        ClientException('offline').toApiException().kind,
        ApiErrorKind.network,
      );
    });

    test('passes ApiException through untouched', () {
      const original = ApiException(kind: ApiErrorKind.validation);
      expect(original.toApiException(), same(original));
    });
  });
}
