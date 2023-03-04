import 'package:test/test.dart';
import 'package:z0und/vendor/dropbox_handler.dart';

void main() {
  group('DropboxAuth', () {
    test('.fromMap() copies all data', () {
      final updatedAt = DateTime.now()
          .add(const Duration(seconds: -100))
          .millisecondsSinceEpoch;
      final data = <String, dynamic>{
        DropboxAuth.accessTokenKey: 'accessToken',
        DropboxAuth.refreshTokenKey: 'refreshToken',
        DropboxAuth.expiresInKey: 100,
        DropboxAuth.updatedAtKey: updatedAt,
      };
      final auth = DropboxAuth.fromMap(data);
      expect(auth.accessToken, equals(data[DropboxAuth.accessTokenKey]));
      expect(auth.refreshToken, equals(data[DropboxAuth.refreshTokenKey]));
      expect(auth.expiresInSeconds, equals(data[DropboxAuth.expiresInKey]));
      expect(auth.updatedAt.millisecondsSinceEpoch, equals(updatedAt));
    });

    test('.isExpired returns `true` if auth is expired', () {
      const expiresInSeconds = 10;
      final auth = DropboxAuth()
        ..accessToken = 'token'
        ..expiresInSeconds = expiresInSeconds
        ..updatedAt =
            DateTime.now().add(const Duration(seconds: -expiresInSeconds));
      expect(auth.isExpired, isTrue);
    });

    test('.isExpired returns `false` if auth is not expired', () {
      const expiresInSeconds = 10;
      final auth = DropboxAuth()
        ..accessToken = 'token'
        ..expiresInSeconds = expiresInSeconds
        ..updatedAt =
            DateTime.now().add(const Duration(seconds: expiresInSeconds));
      expect(auth.isExpired, isFalse);
    });

    test('.putAll() copies all data', () {
      final updatedAt = DateTime.now()
          .add(const Duration(seconds: -100))
          .millisecondsSinceEpoch;
      final data = <String, dynamic>{
        DropboxAuth.accessTokenKey: 'accessToken',
        DropboxAuth.refreshTokenKey: 'refreshToken',
        DropboxAuth.expiresInKey: 100,
        DropboxAuth.updatedAtKey: updatedAt,
      };
      final auth = DropboxAuth()..putAll(data);
      expect(auth.accessToken, equals(data[DropboxAuth.accessTokenKey]));
      expect(auth.refreshToken, equals(data[DropboxAuth.refreshTokenKey]));
      expect(auth.expiresInSeconds, equals(data[DropboxAuth.expiresInKey]));
      expect(auth.updatedAt.millisecondsSinceEpoch, equals(updatedAt));
    });

    test('.putAll() without `updatedAt` sets `updatedAt` to now', () {
      final auth = DropboxAuth()
        ..updatedAt = DateTime.now().add(const Duration(days: -1));
      final updatedAtMillis = auth.updatedAt.millisecondsSinceEpoch;
      auth.putAll({});
      expect(auth.updatedAt.millisecondsSinceEpoch, isNot(updatedAtMillis));
    });
  });
}
