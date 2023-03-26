import '../ioc.dart';

abstract class StorageService {
  factory StorageService() => Ioc.get<StorageService>();

  Future<String?> read(String key);

  Future<bool?> readBool(String key);

  Future write(String key, String? value);

  Future writeBool(String key, bool? value);
}
