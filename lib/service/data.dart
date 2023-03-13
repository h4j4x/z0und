import '../ioc.dart';
import '../model/audio_meta.dart';
import '../model/audio_source.dart';

abstract class DataService {
  factory DataService() => Ioc.get<DataService>();

  /// Scans for audios metas and saves it.
  Future<List<AudioMeta>> scanAudiosMetas();

  /// Fetch audios metas.
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true});

  /// Fetch audio source of audio meta.
  Future<AudioSource?> audioSourceOf(AudioMeta audioMeta);

  /// Saves audio meta and returns [id].
  Future<int> saveAudioMeta(AudioMeta audioMeta);
}
