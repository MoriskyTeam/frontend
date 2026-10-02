import 'package:cloud_functions/cloud_functions.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Converts platform errors into [ApiException]s with a consistent
/// [ApiErrorKind]. Repositories wrap service calls in `try / on
/// FirebaseException` blocks and delegate to this mapper so the rest of the
/// stack only ever sees one error shape.
extension FirebaseErrorMapper on Object {
  ApiException toApiException([StackTrace? stackTrace]) {
    final stack = stackTrace ?? StackTrace.current;

    if (this is ApiException) return this as ApiException;

    if (this is FirebaseAuthException) {
      final e = this as FirebaseAuthException;
      return ApiException(
        kind: _authKind(e.code),
        message: e.message ?? e.code,
        cause: e,
        stackTrace: stack,
      );
    }
    if (this is FirebaseFunctionsException) {
      final e = this as FirebaseFunctionsException;
      return ApiException(
        kind: _functionsKind(e.code),
        message: e.message ?? e.code,
        cause: e,
        stackTrace: stack,
      );
    }
    if (this is FirebaseException) {
      final e = this as FirebaseException;
      // Firestore + Storage share FirebaseException — distinguish by plugin.
      final kind = e.plugin == 'firebase_storage'
          ? _storageKind(e.code)
          : _firestoreKind(e.code);
      return ApiException(
        kind: kind,
        message: e.message ?? e.code,
        cause: e,
        stackTrace: stack,
      );
    }
    return ApiException(
      kind: ApiErrorKind.unknown,
      message: toString(),
      cause: this,
      stackTrace: stack,
    );
  }
}

ApiErrorKind _authKind(String code) {
  switch (code) {
    case 'network-request-failed':
      return ApiErrorKind.network;
    case 'user-not-found':
    case 'invalid-credential':
    case 'wrong-password':
    case 'invalid-verification-code':
      return ApiErrorKind.unauthorized;
    case 'user-disabled':
    case 'operation-not-allowed':
      return ApiErrorKind.forbidden;
    case 'email-already-in-use':
    case 'account-exists-with-different-credential':
      return ApiErrorKind.conflict;
    default:
      return ApiErrorKind.client;
  }
}

ApiErrorKind _firestoreKind(String code) {
  switch (code) {
    case 'unavailable':
    case 'deadline-exceeded':
      return ApiErrorKind.network;
    case 'unauthenticated':
      return ApiErrorKind.unauthorized;
    case 'permission-denied':
      return ApiErrorKind.forbidden;
    case 'not-found':
      return ApiErrorKind.notFound;
    case 'already-exists':
    case 'aborted':
      return ApiErrorKind.conflict;
    case 'cancelled':
      return ApiErrorKind.cancelled;
    case 'failed-precondition':
    case 'invalid-argument':
    case 'out-of-range':
      return ApiErrorKind.validation;
    case 'internal':
    case 'data-loss':
    case 'unknown':
      return ApiErrorKind.server;
    default:
      return ApiErrorKind.client;
  }
}

ApiErrorKind _functionsKind(String code) {
  switch (code) {
    case 'unavailable':
    case 'deadline-exceeded':
      return ApiErrorKind.network;
    case 'unauthenticated':
      return ApiErrorKind.unauthorized;
    case 'permission-denied':
      return ApiErrorKind.forbidden;
    case 'not-found':
      return ApiErrorKind.notFound;
    case 'invalid-argument':
    case 'failed-precondition':
      return ApiErrorKind.validation;
    case 'internal':
      return ApiErrorKind.server;
    case 'cancelled':
      return ApiErrorKind.cancelled;
    default:
      return ApiErrorKind.client;
  }
}

ApiErrorKind _storageKind(String code) {
  switch (code) {
    case 'object-not-found':
      return ApiErrorKind.notFound;
    case 'unauthenticated':
      return ApiErrorKind.unauthorized;
    case 'unauthorized':
      return ApiErrorKind.forbidden;
    case 'retry-limit-exceeded':
    case 'server-file-wrong-size':
      return ApiErrorKind.network;
    case 'cancelled':
      return ApiErrorKind.cancelled;
    default:
      return ApiErrorKind.client;
  }
}
