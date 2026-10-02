import 'package:equatable/equatable.dart';

/// Canonical error envelope returned through the railway `Either` chain.
///
/// Concrete causes are expressed via [ApiError] subtypes. The presentation
/// layer matches on the enum tag to render strings / retry / sign-out flows.
sealed class ErrorResult extends Equatable {
  const ErrorResult({this.message, this.cause});

  final String? message;
  final Object? cause;

  @override
  List<Object?> get props => [runtimeType, message];
}

/// Network unreachable, timeouts, DNS, etc.
class NetworkError extends ErrorResult {
  const NetworkError({super.message, super.cause});
}

/// HTTP / Firebase 4xx response that wasn't auth-related.
class ClientError extends ErrorResult {
  const ClientError({this.statusCode, super.message, super.cause});

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

/// HTTP / Firebase 5xx response.
class ServerError extends ErrorResult {
  const ServerError({this.statusCode, super.message, super.cause});

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

/// 401 / expired session / app check violation. Presentation should redirect
/// to sign-in.
class AuthError extends ErrorResult {
  const AuthError({super.message, super.cause});
}

/// 403 — authenticated but not allowed.
class PermissionError extends ErrorResult {
  const PermissionError({super.message, super.cause});
}

/// Local validation failure (e.g. empty submit, drawing too short).
class ValidationError extends ErrorResult {
  const ValidationError({super.message, this.field, super.cause});

  final String? field;

  @override
  List<Object?> get props => [...super.props, field];
}

/// Catch-all. Always include `cause` for crashlytics.
class UnknownError extends ErrorResult {
  const UnknownError({super.message, super.cause});
}
