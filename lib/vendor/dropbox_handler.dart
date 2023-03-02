import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:z0und/z0und.dart';

import '../helper/http.dart';
import '../service/storage.dart';
import 'openid_handler.dart';

/// Dropbox integration.
///
/// * [Dropbox documentation](https://www.dropbox.com/developers/documentation/http/documentation)
class DropboxOpenidHandler with ChangeNotifier implements OpenidHandler {
  static DropboxOpenidHandler of(BuildContext context, {bool listen = true}) {
    return Provider.of<DropboxOpenidHandler>(context, listen: listen);
  }

  late String _clientId;
  late String _clientSecret;
  late String _redirectUri;
  final _auth = _DropboxAuth();
  final _authKey = 'dropbox_auth';

  DropboxOpenidHandler.create() {
    StorageService().read(_authKey).then((value) {
      if (value != null) {
        final Map<String, dynamic> data = jsonDecode(value);
        _auth.putAll(data);
      }
    });
    _clientId = Z0undConfig.getConfig(Z0undConfig.dropboxClientId);
    _clientSecret = Z0undConfig.getConfig(Z0undConfig.dropboxClientSecret);
    _redirectUri = Z0undConfig.getConfig(Z0undConfig.dropboxRedirectUri);
  }

  Future<String?> get authToken async {
    if (_auth.accessToken != null && _auth.isExpired) {
      await _refreshAuth();
    }
    return _auth.accessToken;
  }

  @override
  String authUrl() => 'https://www.dropbox.com/oauth2/authorize'
      '?client_id=$_clientId'
      '&response_type=code'
      '&scope=openid%20email'
      '&redirect_uri=$_redirectUri';

  @override
  bool canProcessUrl(String url) => url.startsWith(_redirectUri);

  @override
  Future<String?> processUrl(String url) async {
    final uri = Uri.parse(url);
    final code = uri.queryParameters['code'];
    try {
      final Map<String, dynamic> data = await HttpHelper.postJson(url, data: {
        'code': code,
        'grant_type': 'authorization_code',
        'redirect_uri': _redirectUri,
        'client_id': _clientId,
        'client_secret': _clientSecret,
      });
      await _save(data);
      return null;
    } catch (e) {
      return e.toString(); // todo
    }
  }

  Future _save(Map<String, dynamic> data) async {
    _auth.putAll(data);
    notifyListeners();
    await StorageService().write(_authKey, jsonEncode(_auth.map));
  }

  Future _refreshAuth() async {
    const url = 'https://api.dropbox.com/oauth2/token';
    try {
      final Map<String, dynamic> data = await HttpHelper.postJson(url, data: {
        'refresh_token': _auth.refreshToken,
        'grant_type': 'refresh_token',
        'redirect_uri': _redirectUri,
        'client_id': _clientId,
        'client_secret': _clientSecret,
      });
      await _save(data);
    } catch (e) {
      // todo: handle
    }
  }
}

class _DropboxAuth {
  final accountIdKey = 'accountId';
  final accessTokenKey = 'access_token';
  final refreshTokenKey = 'refresh_token';
  final expiresInKey = 'expires_in';
  final updatedAtKey = 'updated_at';

  String? accountId;
  String? accessToken;
  String? refreshToken;
  int? expiresInSeconds;
  DateTime updatedAt = DateTime.now();

  bool get isExpired {
    if (expiresInSeconds != null) {
      final expiresAt = updatedAt.add(Duration(seconds: expiresInSeconds!));
      return expiresAt.isAfter(DateTime.now());
    }
    return true;
  }

  void putAll(Map<String, dynamic> data) {
    accountId = data[accountIdKey] as String?;
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

  Map<String, dynamic> get map => <String, dynamic>{
        accountIdKey: accountId,
        accessTokenKey: accessToken,
        refreshTokenKey: refreshToken,
        expiresInKey: expiresInSeconds,
        updatedAtKey: updatedAt.millisecondsSinceEpoch,
      };
}