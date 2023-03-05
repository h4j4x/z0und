import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/http.dart';
import '../helper/string.dart';
import '../service/storage.dart';
import '../z0und.dart';
import 'openid_handler.dart';

/// Dropbox integration.
///
/// * [Dropbox documentation](https://www.dropbox.com/developers/documentation/http/documentation)
class DropboxHandler with ChangeNotifier implements OpenidHandler {
  static const _authKey = 'dropbox_auth';

  static DropboxHandler of(BuildContext context, {bool listen = true}) {
    return Provider.of<DropboxHandler>(context, listen: listen);
  }

  static Future<DropboxHandler> create() async {
    final authJson = await StorageService().read(_authKey);
    final data = <String, dynamic>{};
    if (authJson != null) {
      data.addAll(jsonDecode(authJson));
    }
    return DropboxHandler._(
      data: data,
      clientId: Z0undConfig.dropboxClientId ?? '-',
      clientSecret: Z0undConfig.dropboxClientSecret ?? '-',
      redirectUri: Z0undConfig.dropboxRedirectUri ?? '-',
    );
  }

  final String clientId;
  final String clientSecret;
  final String redirectUri;
  final String _codeChallenge = generateRandomString(45);
  final DropboxAuth _auth;

  DropboxHandler._({
    required Map<String, dynamic> data,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
  }) : _auth = DropboxAuth.fromMap(data);

  bool get isEnabled =>
      clientId.length > 1 && clientSecret.length > 1 && redirectUri.length > 1;

  Future<String?> get authToken async {
    if (_auth.accessToken != null && _auth.isExpired) {
      await _refreshAuth();
    }
    return _auth.accessToken;
  }

  Uri get tokenUri => Uri.parse('https://api.dropbox.com/oauth2/token');

  @override
  String authUrl() => 'https://www.dropbox.com/oauth2/authorize'
      '?client_id=$clientId'
      '&response_type=code'
      '&token_access_type=offline'
      '&code_challenge=$_codeChallenge'
      '&code_challenge_method=plain'
      '&redirect_uri=$redirectUri';

  @override
  bool canProcessUrl(String url) => url.startsWith(redirectUri);

  @override
  Future<String?> processUrl(String url) async {
    final uri = Uri.parse(url);
    final code = uri.queryParameters['code'].toString();
    try {
      final body = <String, String>{
        'code': code,
        'grant_type': 'authorization_code',
        'code_verifier': _codeChallenge,
        'redirect_uri': redirectUri,
      };
      final Map<String, dynamic> data = await tokenUri.postForm(
        body: body,
        basicAuthUser: clientId,
        basicAuthPass: clientSecret,
      );
      await _save(data);
      return null;
    } catch (e) {
      debugPrint('Processing dropbox auth url error: $e');
      return e.toString(); // todo
    }
  }

  Future _refreshAuth() async {
    final body = <String, dynamic>{
      'refresh_token': _auth.refreshToken,
      'grant_type': 'refresh_token',
      'redirect_uri': redirectUri,
      'client_id': clientId,
      'client_secret': clientSecret,
    };
    try {
      final Map<String, dynamic> data = await tokenUri.postJson(body: body);
      await _save(data);
    } catch (e) {
      debugPrint('Refreshing dropbox auth error: $e');
      // todo: handle
    }
  }

  Future _save(Map<String, dynamic> data) async {
    _auth.putAll(data);
    notifyListeners();
    await StorageService().write(_authKey, jsonEncode(_auth.map));
  }
}

class DropboxAuth {
  static const accessTokenKey = 'access_token';
  static const refreshTokenKey = 'refresh_token';
  static const expiresInKey = 'expires_in';
  static const updatedAtKey = 'updated_at';

  String? accessToken;
  String? refreshToken;
  int? expiresInSeconds;
  DateTime updatedAt;

  DropboxAuth() : updatedAt = DateTime.now();

  factory DropboxAuth.fromMap(Map<String, dynamic> data) {
    final auth = DropboxAuth();
    auth.putAll(data);
    return auth;
  }

  bool get isExpired {
    if (expiresInSeconds != null) {
      final expiresAt = updatedAt.add(Duration(seconds: expiresInSeconds!));
      return expiresAt.isBefore(DateTime.now());
    }
    return true;
  }

  void putAll(Map<String, dynamic> data) {
    accessToken = data[accessTokenKey] as String?;
    refreshToken = data[refreshTokenKey] as String?;
    expiresInSeconds = data[expiresInKey] as int?;
    if (data.containsKey(updatedAtKey)) {
      final millis = data[updatedAtKey] as int;
      updatedAt = DateTime.fromMillisecondsSinceEpoch(millis);
    } else {
      updatedAt = DateTime.now();
    }
  }

  get map => <String, dynamic>{
        accessTokenKey: accessToken,
        refreshTokenKey: refreshToken,
        expiresInKey: expiresInSeconds,
        updatedAtKey: updatedAt.millisecondsSinceEpoch,
      };
}
