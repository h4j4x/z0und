import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final _instance = StorageService._();

  StorageService._() : _secureStorage = const FlutterSecureStorage();

  factory StorageService() => _instance;

  final FlutterSecureStorage _secureStorage;

  Future<String?> read(String key) => _secureStorage.read(key: key);

  Future write(String key, String? value) {
    if (value == null) {
      return _secureStorage.delete(key: key);
    }
    return _secureStorage.write(key: key, value: value);
  }
}
