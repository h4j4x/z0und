import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:z0und/config.dart';
import 'package:z0und/handler/dropbox_handler.dart';
import 'package:z0und/service/config.dart';
import 'package:z0und/service/http.dart';
import 'package:z0und/service/storage.dart';

import '../ioc.dart';

void main() {
  group('DropboxHandler', () {
    setupTestIoc();

    test('.create() reads from ConfigService and StorageService', () async {
      final configService = ConfigService();
      when(configService.read(Z0undConfig.dropboxClientIdKey))
          .thenReturn(Z0undConfig.dropboxClientIdKey);
      when(configService.read(Z0undConfig.dropboxClientSecretKey))
          .thenReturn(Z0undConfig.dropboxClientSecretKey);
      when(configService.read(Z0undConfig.dropboxRedirectUriKey))
          .thenReturn(Z0undConfig.dropboxRedirectUriKey);
      final storageService = StorageService();
      when(storageService.read(DropboxHandler.authKey))
          .thenAnswer((_) => Future.value(null));

      final handler = await DropboxHandler.create();
      expect(handler.isEnabled, isTrue);
      expect(handler.clientId, equals(Z0undConfig.dropboxClientIdKey));
      expect(handler.clientSecret, equals(Z0undConfig.dropboxClientSecretKey));
      expect(handler.redirectUri, equals(Z0undConfig.dropboxRedirectUriKey));

      verifyInOrder([
        configService.read(Z0undConfig.dropboxClientIdKey),
        configService.read(Z0undConfig.dropboxClientSecretKey),
        configService.read(Z0undConfig.dropboxRedirectUriKey),
      ]);
      verify(storageService.read(DropboxHandler.authKey));
    });

    test('.isEnabled is `false` if no configured', () async {
      final configService = ConfigService();
      when(configService.read(Z0undConfig.dropboxClientIdKey)).thenReturn(null);
      when(configService.read(Z0undConfig.dropboxClientSecretKey))
          .thenReturn(null);
      when(configService.read(Z0undConfig.dropboxRedirectUriKey))
          .thenReturn(null);
      final storageService = StorageService();
      when(storageService.read(DropboxHandler.authKey))
          .thenAnswer((_) => Future.value(null));

      final handler = await DropboxHandler.create();
      expect(handler.isEnabled, isFalse);

      verifyInOrder([
        configService.read(Z0undConfig.dropboxClientIdKey),
        configService.read(Z0undConfig.dropboxClientSecretKey),
        configService.read(Z0undConfig.dropboxRedirectUriKey),
      ]);
      verify(storageService.read(DropboxHandler.authKey));
    });

    test('.authToken not expired parsed and returned', () async {
      final configService = ConfigService();
      when(configService.read(Z0undConfig.dropboxClientIdKey))
          .thenReturn(Z0undConfig.dropboxClientIdKey);
      when(configService.read(Z0undConfig.dropboxClientSecretKey))
          .thenReturn(Z0undConfig.dropboxClientSecretKey);
      when(configService.read(Z0undConfig.dropboxRedirectUriKey))
          .thenReturn(Z0undConfig.dropboxRedirectUriKey);
      final storageService = StorageService();
      const accessToken = 'access_token';
      when(storageService.read(DropboxHandler.authKey))
          .thenAnswer((_) => Future.value(jsonEncode(<String, dynamic>{
                DropboxAuth.accessTokenKey: accessToken,
                DropboxAuth.expiresInKey: 10,
                DropboxAuth.updatedAtKey: DateTime.now().millisecondsSinceEpoch,
              })));

      final handler = await DropboxHandler.create();
      expect(handler.isEnabled, isTrue);
      final authToken = await handler.authToken;
      expect(authToken, equals(accessToken));

      verifyInOrder([
        configService.read(Z0undConfig.dropboxClientIdKey),
        configService.read(Z0undConfig.dropboxClientSecretKey),
        configService.read(Z0undConfig.dropboxRedirectUriKey),
      ]);
      verify(storageService.read(DropboxHandler.authKey));
    });

    test('.authToken expired parsed and refreshed', () async {
      final configService = ConfigService();
      when(configService.read(Z0undConfig.dropboxClientIdKey))
          .thenReturn(Z0undConfig.dropboxClientIdKey);
      when(configService.read(Z0undConfig.dropboxClientSecretKey))
          .thenReturn(Z0undConfig.dropboxClientSecretKey);
      when(configService.read(Z0undConfig.dropboxRedirectUriKey))
          .thenReturn(Z0undConfig.dropboxRedirectUriKey);
      final storageService = StorageService();
      const refreshToken = 'refresh_token';
      when(storageService.read(DropboxHandler.authKey))
          .thenAnswer((_) => Future.value(jsonEncode(<String, dynamic>{
                DropboxAuth.accessTokenKey: 'access_token',
                DropboxAuth.refreshTokenKey: refreshToken,
                DropboxAuth.expiresInKey: 1,
                DropboxAuth.updatedAtKey: DateTime.now()
                    .add(const Duration(seconds: -10))
                    .millisecondsSinceEpoch,
              })));
      when(storageService.write(DropboxHandler.authKey, any))
          .thenAnswer((_) => Future.value(null));
      final httpService = HttpService();
      const accessToken = 'refreshed_access_token';
      final refreshBody = <String, String>{
        'refresh_token': refreshToken,
        'grant_type': 'refresh_token',
      };
      when(httpService.postForm(
        DropboxHandler.tokenUri,
        body: refreshBody,
        basicAuthUser: Z0undConfig.dropboxClientIdKey,
        basicAuthPass: Z0undConfig.dropboxClientSecretKey,
      )).thenAnswer((_) => Future.value(<String, dynamic>{
            DropboxAuth.accessTokenKey: accessToken,
            DropboxAuth.refreshTokenKey: refreshToken,
            DropboxAuth.expiresInKey: 1,
            DropboxAuth.updatedAtKey: DateTime.now().millisecondsSinceEpoch,
          }));

      final handler = await DropboxHandler.create();
      expect(handler.isEnabled, isTrue);
      final authToken = await handler.authToken;
      expect(authToken, equals(accessToken));

      verifyInOrder([
        configService.read(Z0undConfig.dropboxClientIdKey),
        configService.read(Z0undConfig.dropboxClientSecretKey),
        configService.read(Z0undConfig.dropboxRedirectUriKey),
      ]);
      verify(storageService.read(DropboxHandler.authKey));
      verify(storageService.write(DropboxHandler.authKey, any));
      verify(httpService.postForm(
        DropboxHandler.tokenUri,
        body: refreshBody,
        basicAuthUser: Z0undConfig.dropboxClientIdKey,
        basicAuthPass: Z0undConfig.dropboxClientSecretKey,
      ));
    });
  });

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
