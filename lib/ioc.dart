import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'handler/impl/device_handler.dart';
import 'handler/impl/dropbox_handler.dart';
import 'service/audio_player.dart';
import 'service/config.dart';
import 'service/data.dart';
import 'service/http.dart';
import 'service/impl/dotenv_config.dart';
import 'service/impl/flutter_http.dart';
import 'service/impl/isar_data.dart';
import 'service/impl/just_audio_player.dart';
import 'service/impl/secure_storage.dart';
import 'service/storage.dart';

class Ioc {
  Ioc._();

  static T get<T extends Object>() => GetIt.I<T>();

  static Future createServices() async {
    GetIt.I.registerSingleton<StorageService>(
      SecureStorageService.create(),
    );
    GetIt.I.registerLazySingleton<HttpService>(
      () => FlutterHttpService.create(),
    );
    GetIt.I.registerSingleton<ConfigService>(
      await DotenvConfigService.create(),
    );
    GetIt.I.registerSingleton<DataService>(
      await IsarDataService.create(),
    );
    GetIt.I.registerSingleton<DropboxHandler>(
      await DropboxHandler.create(),
    );
    GetIt.I.registerSingleton<DeviceAudioMetaHandler>(
      DeviceAudioMetaHandler.create(),
    );
  }

  static List<SingleChildWidget> createProviders() => <SingleChildWidget>[
        ChangeNotifierProvider<AudioPlayer>(
          create: (_) => JustAudioPlayer.create(),
        ),
      ];
}
