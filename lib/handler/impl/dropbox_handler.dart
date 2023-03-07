import 'dart:convert';

import 'package:flutter/material.dart';

import '../../config.dart';
import '../../helper/string.dart';
import '../../helper/uri.dart';
import '../../ioc.dart';
import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../../service/storage.dart';
import '../audio_meta_handler.dart';
import '../openid_handler.dart';

/// Dropbox integration.
///
/// * [Dropbox documentation](https://www.dropbox.com/developers/documentation/http/documentation)
class DropboxHandler implements OpenidHandler, AudioMetaHandler {
  static const id = 'dropbox';
  static const authKey = 'dropbox_auth';

  static final tokenUri = Uri.parse('https://api.dropbox.com/oauth2/token');

  static Future<DropboxHandler> create() async {
    final authJson = await StorageService().read(authKey);
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

  factory DropboxHandler() => Ioc.get<DropboxHandler>();

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
    if (isEnabled) {
      if (_auth.accessToken != null && _auth.isExpired) {
        await _refreshAuth();
      }
      return _auth.accessToken;
    }
    return null;
  }

  @override
  String get authUrl => 'https://www.dropbox.com/oauth2/authorize'
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
    final body = <String, String>{
      'refresh_token': _auth.refreshToken ?? '',
      'grant_type': 'refresh_token',
    };
    try {
      final Map<String, dynamic> data = await tokenUri.postForm(
        body: body,
        basicAuthUser: clientId,
        basicAuthPass: clientSecret,
      );
      await _save(data);
    } catch (e) {
      debugPrint('Refreshing dropbox auth error: $e');
      // todo: handle
    }
  }

  @override
  String get handlerId => id;

  @override
  Future<bool> get handlerIsEnabled async {
    final token = await authToken;
    return token != null;
  }

  Uri _apiBaseUri(String endpoint) =>
      Uri.parse('https://api.dropboxapi.com/2$endpoint');

  @override
  Future<List<AudioMeta>> listAudiosMetas() async {
    final uri = _apiBaseUri('/files/list_folder');
    final token = await authToken;
    final body = <String, dynamic>{
      'recursive': true,
      'path': '',
      'include_mounted_folders': true,
      'include_media_info': true,
    };
    try {
      final Map<String, dynamic> data = await uri.postJson(
        authBearer: token,
        body: body,
      );
      final files = (data['entries'] as List?) ?? [];
      return files
          .where((entry) => DropboxAudioMeta.canParse(entry))
          .map<AudioMeta>((entry) => DropboxAudioMeta.fromMap(entry))
          .toList();
    } catch (e) {
      debugPrint('List sources dropbox error: $e');
      // todo: handle
    }
    return [];
  }

  @override
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta) async {
    final uri = _apiBaseUri('/files/get_temporary_link');
    final token = await authToken;
    final body = <String, dynamic>{
      'path': audioMeta.code,
    };
    try {
      final Map<String, dynamic> data = await uri.postJson(
        authBearer: token,
        body: body,
      );
      if (data.containsKey('link') && data['link'] is String) {
        return DropboxAudioSource(data['link'].toString());
      }
    } catch (e) {
      debugPrint('fetch audio source dropbox error: $e');
      // todo: handle
    }
    return null;
  }

  Future removeAuth() {
    _auth.clear();
    return _save({});
  }

  Future _save(Map<String, dynamic> data) async {
    _auth.putAll(data);
    await StorageService().write(authKey, jsonEncode(_auth.map));
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
    accessToken = (data[accessTokenKey] as String?) ?? accessToken;
    refreshToken = (data[refreshTokenKey] as String?) ?? refreshToken;
    expiresInSeconds = (data[expiresInKey] as int?) ?? expiresInSeconds;
    if (data.containsKey(updatedAtKey)) {
      final millis = data[updatedAtKey] as int;
      updatedAt = DateTime.fromMillisecondsSinceEpoch(millis);
    } else {
      updatedAt = DateTime.now();
    }
  }

  Map<String, dynamic> get map => <String, dynamic>{
        accessTokenKey: accessToken,
        refreshTokenKey: refreshToken,
        expiresInKey: expiresInSeconds,
        updatedAtKey: updatedAt.millisecondsSinceEpoch,
      }..removeWhere((_, value) => value == null);

  void clear() {
    accessToken = null;
    refreshToken = null;
    expiresInSeconds = null;
    updatedAt = DateTime.now();
  }
}

class DropboxAudioMeta implements AudioMeta {
  static bool canParse(entry) =>
      entry is Map &&
      entry.containsKey('name') &&
      entry['name'] is String &&
      entry['path_lower'] is String &&
      entry['name'].toString().endsWith('.mp3');

  static AudioMeta fromMap(Map map) => DropboxAudioMeta(
        name: map['name'].toString(),
        code: map['path_lower'].toString(),
      );

  @override
  final String name;

  @override
  final String handlerId;

  @override
  final String code;

  @override
  String? audioName;

  @override
  int? durationInSeconds;

  @override
  bool get enabled => true;

  DropboxAudioMeta({
    required this.name,
    required this.code,
  }) : handlerId = DropboxHandler.id;
}

class DropboxAudioSource implements AudioSource {
  @override
  final AudioSourceType sourceType;

  @override
  final String source;

  DropboxAudioSource(this.source) : sourceType = AudioSourceType.url;
}
