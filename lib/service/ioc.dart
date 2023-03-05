import 'package:get_it/get_it.dart';

import '../vendor/dropbox_handler.dart';
import 'config.dart';
import 'http.dart';
import 'storage.dart';

Future setupIoc() async {
  GetIt.I.registerSingleton<StorageService>(StorageService.create());
  GetIt.I.registerLazySingleton<HttpService>(() => HttpService.create());
  GetIt.I.registerSingleton<ConfigService>(await ConfigService.create());
  GetIt.I.registerSingleton<DropboxHandler>(await DropboxHandler.create());
}
