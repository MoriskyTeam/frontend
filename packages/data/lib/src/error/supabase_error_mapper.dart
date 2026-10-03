import 'package:domain/domain.dart';
import 'package:http/http.dart' show ClientException;
import 'package:supabase_flutter/supabase_flutter.dart';

/// Converts platform errors into [ApiException]s with a consistent
/// [ApiErrorKind]. Repositories wrap service calls in `try / on Object`
/// blocks and delegate to this mapper so the rest of the stack only ever
/// sees one error shape.
extension SupabaseErrorMapper on Object {
  ApiException toApiException([StackTrace? stackTrace]) {
    final stack = stackTrace ?? StackTrace.current;
    final error = this;

    ApiException build(ApiErrorKind kind, String? message, {int? status}) =>
        ApiException(
          kind: kind,
          statusCode: status,
          message: message,
          cause: error,
          stackTrace: stack,
        );

    return switch (error) {
      ApiException() => error,
      PostgrestException(:final code, :final message) => build(
        postgrestKind(code),
        message,
        status: int.tryParse(code ?? ''),
      ),
      AuthException(:final statusCode, :final message) => build(
        httpKind(int.tryParse(statusCode ?? ''), fallback: ApiErrorKind.client),
        message,
        status: int.tryParse(statusCode ?? ''),
      ),
      StorageException(:final statusCode, :final message) => build(
        httpKind(int.tryParse(statusCode ?? ''), fallback: ApiErrorKind.client),
        message,
        status: int.tryParse(statusCode ?? ''),
      ),
      RealtimeSubscribeException(:final details) => build(
        ApiErrorKind.network,
        '$details',
      ),
      ClientException(:final message) => build(ApiErrorKind.network, message),
      _ => build(ApiErrorKind.unknown, error.toString()),
    };
  }
}

/// PostgREST surfaces Postgres error codes (e.g. `23505`), PostgREST codes
/// (`PGRST116`), our own `PTxxx` codes raised by RPCs to set the HTTP status
/// (see `docs/supabase_backend_status.md`) or a bare HTTP status.
ApiErrorKind postgrestKind(String? code) => switch (code) {
  'PT400' => ApiErrorKind.validation,
  'PT401' => ApiErrorKind.unauthorized,
  'PT404' => ApiErrorKind.notFound,
  '42501' => ApiErrorKind.forbidden,
  '23505' => ApiErrorKind.conflict,
  '23502' || '23503' || '23514' || '22P02' => ApiErrorKind.validation,
  'PGRST116' => ApiErrorKind.notFound,
  'PGRST301' || 'PGRST302' => ApiErrorKind.unauthorized,
  _ => httpKind(int.tryParse(code ?? ''), fallback: ApiErrorKind.server),
};

ApiErrorKind httpKind(int? status, {required ApiErrorKind fallback}) =>
    switch (status) {
      null => fallback,
      401 => ApiErrorKind.unauthorized,
      403 => ApiErrorKind.forbidden,
      404 => ApiErrorKind.notFound,
      409 => ApiErrorKind.conflict,
      422 => ApiErrorKind.validation,
      >= 500 => ApiErrorKind.server,
      >= 400 => ApiErrorKind.client,
      _ => fallback,
    };
