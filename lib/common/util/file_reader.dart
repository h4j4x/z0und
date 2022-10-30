import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

enum FileSource {
  asset,
  device,
  googleDrive,
}

abstract class FileReader {
  Future<int> bytesLength(String path);

  Stream<ByteBuffer> stream(String path);

  Future<ByteBuffer> readAll(String path);

  static final _readers = <FileSource, FileReader>{
    FileSource.asset: _AssetFileReader(),
    FileSource.device: _DeviceFileReader(),
  };

  static Future<int> readBytesLength(String path, FileSource source) {
    final reader = _readers[source];
    if (reader != null) {
      return reader.bytesLength(path);
    }
    return Future.value(-1);
  }

  static Stream<ByteBuffer> read(String path, FileSource source) {
    final reader = _readers[source];
    if (reader != null) {
      return reader.stream(path);
    }
    return const Stream.empty();
  }

  static Future<ByteBuffer?> readFull(String path, FileSource source) {
    final reader = _readers[source];
    if (reader != null) {
      return reader.readAll(path);
    }
    return Future.value(null);
  }
}

class _AssetFileReader implements FileReader {
  @override
  Future<int> bytesLength(String path) async {
    final data = await rootBundle.load(path);
    return data.lengthInBytes;
  }

  @override
  Stream<ByteBuffer> stream(String path) async* {
    final data = await rootBundle.load(path);
    yield data.buffer;
  }

  @override
  Future<ByteBuffer> readAll(String path) async {
    final data = await rootBundle.load(path);
    return data.buffer;
  }
}

class _DeviceFileReader implements FileReader {
  @override
  Future<int> bytesLength(String path) async {
    final file = File(path);
    return file.length();
  }

  @override
  Stream<ByteBuffer> stream(String path) {
    final file = File(path);
    return file.openRead().map((list) => Uint8List.fromList(list).buffer);
  }

  @override
  Future<ByteBuffer> readAll(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    return bytes.buffer;
  }
}
