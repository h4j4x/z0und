import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  FileHelper._();

  static Future<File> writeDocumentsFile({
    required String filename,
    required Stream<List<int>> stream,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    final exists = await file.exists();
    if (exists) {
      await file.delete();
    }
    final list = await stream.toList();
    for (final intList in list) {
      await file.writeAsBytes(intList, mode: FileMode.writeOnlyAppend);
    }
    return file;
  }
}
