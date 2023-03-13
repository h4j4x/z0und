import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';

import '../../firebase_options.dart';
import '../../ioc.dart';
import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../audio_meta_handler.dart';

/// Google integration
class GoogleHandler implements AudioMetaHandler {
  static const _id = 'google';

  static Future<GoogleHandler> create() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final handler = GoogleHandler._();
    AudioMetaHandler.registerHandler(handler);
    return handler;
  }

  final GoogleSignIn googleSignIn;

  factory GoogleHandler() => Ioc.get<GoogleHandler>();

  bool get isEnabled => true;

  Future<bool> get hasAccount => handlerIsEnabled;

  GoogleHandler._()
      : googleSignIn = GoogleSignIn(
          scopes: <String>[
            DriveApi.driveMetadataReadonlyScope,
            DriveApi.driveReadonlyScope,
          ],
        );

  Future auth() async {
    final signed = await hasAccount;
    if (!signed) {
      try {
        return googleSignIn.signIn();
      } catch (error) {
        debugPrint('GOOGLE signIn error: $error');
      }
    }
    return Future.value(null);
  }

  Future removeAuth() => googleSignIn.signOut();

  @override
  String get handlerId => _id;

  @override
  Future<bool> get handlerIsEnabled async {
    await googleSignIn.signInSilently();
    return googleSignIn.isSignedIn();
  }

  @override
  Future<List<AudioMeta>> listAudiosMetas() async {
    await hasAccount;
    final httpClient = (await googleSignIn.authenticatedClient());
    if (httpClient != null) {
      try {
        final driveApi = DriveApi(httpClient);
        final files = await driveApi.files.list(
          corpora: 'user',
          pageSize: 100,
          q: 'mimeType contains \'audio/\'',
        );
        if (files.files != null) {
          return files.files!
              .where((file) => GoogleAudioMeta.canParse(file))
              .map<AudioMeta>((file) => GoogleAudioMeta(
                    name: file.name!,
                    code: file.id!,
                  ))
              .toList();
        }
      } catch (error) {
        debugPrint('GOOGLE listAudiosMetas error: $error');
      } finally {
        httpClient.close();
      }
    }
    return Future.value([]);
  }

  @override
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta) async {
    await hasAccount;
    final httpClient = (await googleSignIn.authenticatedClient());
    if (httpClient != null) {
      try {
        final driveApi = DriveApi(httpClient);
        final file = await driveApi.files.get(
          audioMeta.code,
          $fields: 'webContentLink',
        );
        if (file is File && file.webContentLink != null) {
          return GoogleAudioSource(file.webContentLink!, expiresInDays: 7);
        }
      } catch (error) {
        debugPrint('GOOGLE fetchAudioSource error: $error');
      } finally {
        httpClient.close();
      }
    }
    return Future.value(null);
  }
}

class GoogleAudioMeta implements AudioMeta {
  static bool canParse(File file) => file.name != null && file.id != null;

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

  GoogleAudioMeta({
    required this.name,
    required this.code,
  }) : handlerId = GoogleHandler._id;
}

class GoogleAudioSource implements AudioSource {
  @override
  final AudioSourceType sourceType;

  @override
  final String source;

  @override
  final DateTime expiresAt;

  GoogleAudioSource(this.source, {required int expiresInDays})
      : sourceType = AudioSourceType.url,
        expiresAt = DateTime.now().add(Duration(days: expiresInDays));
}
