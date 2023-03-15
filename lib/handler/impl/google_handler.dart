import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:http/http.dart';

import '../../firebase_options.dart';
import '../../helper/file.dart';
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
    final apiWrapper = await _DriveApiWrapper.create(googleSignIn);
    if (apiWrapper != null) {
      try {
        final files = await apiWrapper.driveApi.files.list(
          corpora: 'user',
          pageSize: 100,
          q: 'mimeType contains \'audio/\'',
        );
        if (files.files != null) {
          return files.files!
              .where((file) => _GoogleAudioMeta.canParse(file))
              .map<AudioMeta>(
                (file) => _GoogleAudioMeta(
                  name: file.name!,
                  code: file.id!,
                ),
              )
              .toList();
        }
      } catch (error) {
        debugPrint('GOOGLE listAudiosMetas error: $error');
      } finally {
        apiWrapper.close();
      }
    }
    return Future.value([]);
  }

  @override
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta) async {
    await hasAccount;
    final apiWrapper = await _DriveApiWrapper.create(googleSignIn);
    if (apiWrapper != null) {
      try {
        final media = await apiWrapper.driveApi.files.get(
          audioMeta.code,
          downloadOptions: DownloadOptions.fullMedia,
        );
        if (media is Media) {
          final filePath = await _saveMediaAsFile(audioMeta, media);
          return _GoogleAudioSource(filePath, expiresInDays: 7);
        }
      } catch (error) {
        debugPrint('GOOGLE fetchAudioSource error: $error');
      } finally {
        apiWrapper.close();
      }
    }
    return Future.value(null);
  }

  Future<String> _saveMediaAsFile(AudioMeta audioMeta, Media media) async {
    final file = await FileHelper.writeDocumentsFile(
      filename: audioMeta.name,
      stream: media.stream,
    );
    return file.path;
  }
}

class _DriveApiWrapper {
  final Client client;
  final DriveApi driveApi;

  _DriveApiWrapper({
    required this.client,
    required this.driveApi,
  });

  void close() => client.close();

  static Future<_DriveApiWrapper?> create(GoogleSignIn googleSignIn) async {
    final httpClient = await googleSignIn.authenticatedClient();
    if (httpClient != null) {
      return _DriveApiWrapper(
        client: httpClient,
        driveApi: DriveApi(httpClient),
      );
    }
    return null;
  }
}

class _GoogleAudioMeta implements AudioMeta {
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

  _GoogleAudioMeta({
    required this.name,
    required this.code,
  }) : handlerId = GoogleHandler._id;
}

class _GoogleAudioSource implements AudioSource {
  @override
  final AudioSourceType sourceType;

  @override
  final String source;

  @override
  final DateTime expiresAt;

  _GoogleAudioSource(this.source, {required int expiresInDays})
      : sourceType = AudioSourceType.file,
        expiresAt = DateTime.now().add(Duration(days: expiresInDays));
}
