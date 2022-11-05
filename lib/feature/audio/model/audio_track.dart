import 'package:equatable/equatable.dart';

import '../../../common/model/file_source.dart';

class AudioTrack extends Equatable {
  final FileSource fileSource;
  final String filePath;

  const AudioTrack({
    required this.fileSource,
    required this.filePath,
  });

  @override
  List<Object?> get props => [filePath, fileSource];
}
