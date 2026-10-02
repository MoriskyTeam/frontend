import 'package:domain/domain.dart' show ErrorResult;
import 'package:domain/src/error/error_result.dart' show ErrorResult;

/// Thrown by data services / repositories when a backend interaction fails.
///
/// Use cases never see this directly — `BaseUseCase.call()` maps it onto an
/// [ErrorResult] inside `Either`.
final class ApiException implements Exception {
  const ApiException({
    required this.kind,
    this.statusCode,
    this.message,
    this.cause,
    this.stackTrace,
  });

  final ApiErrorKind kind;
  final int? statusCode;
  final String? message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() =>
      'ApiException(kind: $kind, status: $statusCode, message: $message)';
}

enum ApiErrorKind {
  network,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  client,
  server,
  validation,
  appCheck,
  cancelled,
  unknown,
}
