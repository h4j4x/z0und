import 'dart:io';

import 'package:dart_tags/dart_tags.dart';

import '../../model/audio_info.dart';
import '../../model/audio_source.dart';
import '../audio_info.dart';

class DartTagsAudioInfoService implements AudioInfoService {
  final TagProcessor _processor;

  DartTagsAudioInfoService.create() : _processor = TagProcessor();

  @override
  Future<AudioInfo?> fetchAudioInfo(AudioSource audioSource) async {
    if (audioSource.sourceType == AudioSourceType.file) {
      final file = File(audioSource.source);
      final tags = await _processor.getTagsFromByteArray(file.readAsBytes());
      if (tags.isNotEmpty) {
        return AudioInfo(
          title: tags.first.tags['title'],
          artist: tags.first.tags['artist'],
        );
      }
    }
    return Future.value(null);
  }
}
