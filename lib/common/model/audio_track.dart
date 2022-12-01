import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class AudioTrack extends Equatable {
  final String name;
  final ByteBuffer buffer;

  const AudioTrack({
    required this.name,
    required this.buffer,
  });

  @override
  List<Object?> get props => [name];

  static Future<AudioTrack> fromAsset(String path) async {
    const path = 'assets/sample-audio-track.mp3';
    final data = await rootBundle.load(path);
    return AudioTrack(
      name: path,
      buffer: data.buffer,
    );
  }
}
