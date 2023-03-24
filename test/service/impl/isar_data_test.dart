import 'dart:ffi';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:z0und/handler/audio_meta_handler.dart';
import 'package:z0und/model/audio_meta.dart';
import 'package:z0und/model/audio_source.dart';
import 'package:z0und/service/impl/isar_data.dart';

void main() async {
  final testDir = path.join(Directory.current.path, 'test');
  await Isar.initializeIsarCore(
    libraries: {
      Abi.linuxX64: path.join(testDir, 'binaries', 'libisar_linux_x64.so'),
    },
  );

  final service = await IsarDataService.create();
  await (service as IsarDataService).clear();

  group('AudioSource', () {
    test('.audioSourceOf() reads from handlers and db', () async {
      final testAudioMetaHandler = TestAudioMetaHandler();
      expect(testAudioMetaHandler.sourcesFetches, 0);

      AudioMetaHandler.registerHandler(testAudioMetaHandler);
      final handler =
          await AudioMetaHandler.getHandler(testAudioMetaHandler.handlerId);
      expect(handler, testAudioMetaHandler);

      final audioMetaId = DateTime.now().millisecondsSinceEpoch.toString();
      final audioMeta = TestAudioMeta(audioMetaId);
      final expectedAudioSource = TestAudioSource(audioMeta);
      // fetch from handler
      final audioSource = await service.audioSourceOf(audioMeta);
      expect(audioSource, isNotNull);
      expect(audioSource!.source, expectedAudioSource.source);
      expect(audioSource.sourceType, expectedAudioSource.sourceType);
      expect(testAudioMetaHandler.sourcesFetches, 1);
      // fetch from db
      for (var i = 0; i < 10; i++) {
        final audioSource = await service.audioSourceOf(audioMeta);
        expect(audioSource, isNotNull);
        expect(audioSource!.source, expectedAudioSource.source);
        expect(audioSource.sourceType, expectedAudioSource.sourceType);
        expect(testAudioMetaHandler.sourcesFetches, 1);
      }
    });
  });
}

const testHandlerId = 'test-handler-id';

class TestAudioMetaHandler implements AudioMetaHandler {
  int sourcesFetches = 0;

  @override
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta) {
    sourcesFetches += 1;
    return Future.value(TestAudioSource(audioMeta));
  }

  @override
  String get handlerId => testHandlerId;

  @override
  Future<bool> get handlerIsEnabled => Future.value(true);

  @override
  Future<List<AudioMeta>> listAudiosMetas() => Future.value([]);
}

class TestAudioMeta implements AudioMeta {
  final String id;

  @override
  String? title;

  @override
  String? artist;

  @override
  Duration? duration;

  TestAudioMeta(this.id);

  @override
  String get code => 'test-audio-meta-$id';

  @override
  bool get enabled => true;

  @override
  String get handlerId => testHandlerId;

  @override
  String get name => 'test-audio-name';
}

class TestAudioSource implements AudioSource {
  final AudioMeta audioMeta;

  TestAudioSource(this.audioMeta);

  @override
  DateTime get expiresAt => DateTime.now().add(const Duration(hours: 24));

  @override
  String get source => 'test-audio-source-${audioMeta.code}';

  @override
  AudioSourceType get sourceType => AudioSourceType.file;
}
