/// Handles openid authentication urls.
abstract class OpenidHandler {
  /// The initial url to start authentication.
  String authUrl();

  /// If given [url] can be processed to obtain authenticated user.
  bool canProcessUrl(String url);

  /// Process given [url] and stores authenticated user.
  ///
  /// Returns `null` if authenticated user was stored or the corresponding error message.
  Future<String?> processUrl(String url);
}

class DropboxOpenidHandler implements OpenidHandler {
  final clientId = 'j93nushune46690'; // fixme: from config
  final redirectUri = 'https://z0und.flutter'; // fixme: from config

  @override
  String authUrl() => 'https://www.dropbox.com/oauth2/authorize'
      '?client_id=$clientId'
      '&response_type=code'
      '&scope=openid%20email'
      '&redirect_uri=$redirectUri';

  @override
  bool canProcessUrl(String url) => url.startsWith(redirectUri);

  @override
  Future<String?> processUrl(String url) async {
    final uri = Uri.parse(url);
    final code = uri.queryParameters['code'];
    /*
      obtain token
      curl https://api.dropbox.com/oauth2/token \
        -d code=$code \
        -d grant_type=authorization_code \
        -d redirect_uri=https://z0und.flutter \
        -d client_id=j93nushune46690 \
        -d client_secret=bpgio0mka9erelz
       */
    return null;
  }
}
