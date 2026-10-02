/// Placeholder return type for use cases whose only outcome is success/failure.
///
/// Prefer this over `void` so that `Either<ErrorResult, NoResult>` can still
/// distinguish success in pattern matching.
class NoResult {
  const NoResult();
}
