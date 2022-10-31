import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

abstract class SourceHandler {
  Future<int> bytesLength(String path);

  Stream<ByteBuffer> stream(String path);

  Future<ByteBuffer> readAll(String path);

  Future<void> copyToFile(String path, File target) async {
    final data = await readAll(path);
    await target.writeAsBytes(data.asUint8List());
  }
}

class AssetHandler extends SourceHandler {
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

class DeviceHandler extends SourceHandler {
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
