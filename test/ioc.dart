import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:z0und/service/config.dart';
import 'package:z0und/service/http.dart';
import 'package:z0und/service/storage.dart';

@GenerateMocks([HttpService, ConfigService, StorageService])
import 'ioc.mocks.dart';

void setupTestIoc() {
  GetIt.I.registerSingleton<StorageService>(MockStorageService());
  GetIt.I.registerSingleton<ConfigService>(MockConfigService());
  GetIt.I.registerSingleton<HttpService>(MockHttpService());
}
