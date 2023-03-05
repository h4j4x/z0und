import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage;

  StorageService.create() : _secureStorage = const FlutterSecureStorage();

  factory StorageService() => GetIt.I<StorageService>();

  Future<String?> read(String key) => _secureStorage.read(key: key);

  Future write(String key, String? value) {
    if (value == null) {
      return _secureStorage.delete(key: key);
    }
    return _secureStorage.write(key: key, value: value);
  }
}
