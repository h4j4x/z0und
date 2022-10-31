import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../model/file_source.dart';
import 'source_handler.dart';

abstract class FileUtils {
  static final _handlers = <FileSource, SourceHandler>{
    FileSource.asset: AssetHandler(),
    FileSource.device: DeviceHandler(),
  };

  static Future<int> readBytesLength(String path, FileSource source) {
    final handler = _handlers[source];
    if (handler != null) {
      return handler.bytesLength(path);
    }
    return Future.value(-1);
  }

  static Stream<ByteBuffer> read(String path, FileSource source) {
    final handler = _handlers[source];
    if (handler != null) {
      return handler.stream(path);
    }
    return const Stream.empty();
  }

  static Future<ByteBuffer?> readFull(String path, FileSource source) {
    final handler = _handlers[source];
    if (handler != null) {
      return handler.readAll(path);
    }
    return Future.value(null);
  }

  static Future<void> copyToFile(String path, FileSource source, File target) {
    final handler = _handlers[source];
    if (handler != null) {
      return handler.copyToFile(path, target);
    }
    return Future.value(null);
  }
}
