import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/http.dart';
import '../service/storage.dart';
import 'openid_handler.dart';

const authKey = 'dropbox_auth';
const accountIdKey = 'accountId';
const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';
const expiresInKey = 'expires_in';
const updatedAtKey = 'updated_at';

class _DropboxAuth {
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

class DropboxOpenidHandler with ChangeNotifier implements OpenidHandler {
  static DropboxOpenidHandler of(BuildContext context, {bool listen = true}) {
    return Provider.of<DropboxOpenidHandler>(context, listen: listen);
  }

  DropboxOpenidHandler.create() {
    StorageService().read(authKey).then((value) {
      if (value != null) {
        final Map<String, dynamic> data = jsonDecode(value);
        _auth.putAll(data);
      }
    });
  }

  final _clientId = 'j93nushune46690'; // fixme: from config
  final _clientSecret = 'bpgio0mka9erelz'; // fixme: from config
  final _redirectUri = 'https://z0und.flutter'; // fixme: from config
  final _auth = _DropboxAuth();

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
    await StorageService().write(authKey, jsonEncode(_auth.map));
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
