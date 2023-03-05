import 'service/config.dart';

class Z0undConfig {
  Z0undConfig._();

  static const dropboxClientIdKey = 'DROPBOX_CLIENT_ID';

  static String? get dropboxClientId => _read(dropboxClientIdKey);

  static const dropboxClientSecretKey = 'DROPBOX_CLIENT_SECRET';

  static String? get dropboxClientSecret => _read(dropboxClientSecretKey);

  static const dropboxRedirectUriKey = 'DROPBOX_REDIRECT_URI';

  static String? get dropboxRedirectUri => _read(dropboxRedirectUriKey);

  static String? _read(String key) => ConfigService().read(key);
}
