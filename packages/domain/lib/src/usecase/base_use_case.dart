import 'package:domain/src/error/api_error.dart';
import 'package:domain/src/error/error_result.dart';
import 'package:fpdart/fpdart.dart';

/// Base use case with a typed parameter.
///
/// `call()` is the public entry point used by cubits. It wraps `execute()` in
/// try/catch and converts thrown [ApiException]s into [ErrorResult]s on the
/// left of the returned `Either`. Concrete use cases override `execute()`
/// only.
abstract class BaseUseCase<TParam, TResult> {
  const BaseUseCase();

  Future<TResult> execute(TParam param);

  Future<Either<ErrorResult, TResult>> call(TParam param) async {
    try {
      final result = await execute(param);
      return Right(result);
    } on ApiException catch (e) {
      return Left(_mapApiException(e));
    } on Object catch (e) {
      return Left(UnknownError(message: e.toString(), cause: e));
    }
  }
}

/// Base use case for parameterless flows.
abstract class BaseUseCaseNoParam<TResult> {
  const BaseUseCaseNoParam();

  Future<TResult> execute();

  Future<Either<ErrorResult, TResult>> call() async {
    try {
      final result = await execute();
      return Right(result);
    } on ApiException catch (e) {
      return Left(_mapApiException(e));
    } on Object catch (e) {
      return Left(UnknownError(message: e.toString(), cause: e));
    }
  }
}

ErrorResult _mapApiException(ApiException e) {
  switch (e.kind) {
    case ApiErrorKind.network:
      return NetworkError(message: e.message, cause: e);
    case ApiErrorKind.unauthorized:
    case ApiErrorKind.appCheck:
      return AuthError(message: e.message, cause: e);
    case ApiErrorKind.forbidden:
      return PermissionError(message: e.message, cause: e);
    case ApiErrorKind.notFound:
    case ApiErrorKind.conflict:
    case ApiErrorKind.client:
      return ClientError(
        statusCode: e.statusCode,
        message: e.message,
        cause: e,
      );
    case ApiErrorKind.server:
      return ServerError(
        statusCode: e.statusCode,
        message: e.message,
        cause: e,
      );
    case ApiErrorKind.validation:
      return ValidationError(message: e.message, cause: e);
    case ApiErrorKind.cancelled:
    case ApiErrorKind.unknown:
      return UnknownError(message: e.message, cause: e);
  }
}
