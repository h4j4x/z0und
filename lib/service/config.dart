import '../ioc.dart';

abstract class ConfigService {
  factory ConfigService() => Ioc.get<ConfigService>();

  String? read(String key);
}
