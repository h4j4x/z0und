import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  static const _audiosSourcesDirectory = 'audios';

  FileHelper._();

  static Future<File> writeDocumentsFile({
    required String filename,
    required Stream<List<int>> stream,
  }) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final file = File('${docsDir.path}/$_audiosSourcesDirectory/$filename');
    final exists = await file.exists();
    if (exists) {
      await file.delete();
    }
    await file.create(recursive: true);
    final list = await stream.toList();
    for (final intList in list) {
      await file.writeAsBytes(intList, mode: FileMode.writeOnlyAppend);
    }
    return file;
  }

  static Future clearDocumentsFolder() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final directory = Directory('${docsDir.path}/$_audiosSourcesDirectory');
    final exists = await directory.exists();
    if (exists) {
      return directory.delete();
    }
    return Future.value(null);
  }
}
