/// Handles openid authentication urls.
abstract class OpenidHandler {
  /// The initial url to start authentication.
  String get authUrl;

  /// If given [url] can be processed to obtain authenticated user.
  bool canProcessUrl(String url);

  /// Process given [url] and stores authenticated user.
  ///
  /// Returns `null` if authenticated user was stored or the corresponding error message.
  Future<String?> processUrl(String url);
}
