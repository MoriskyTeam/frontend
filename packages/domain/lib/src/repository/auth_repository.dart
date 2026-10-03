abstract class AuthRepository {
  /// Makes sure the resident has an identity (anonymous when nothing else),
  /// so their reports and confirmations can be attributed.
  Future<void> ensureSignedIn();
}
