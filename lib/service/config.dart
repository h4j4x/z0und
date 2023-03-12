import '../ioc.dart';

/// App configuration service.
abstract class ConfigService {
  factory ConfigService() => Ioc.get<ConfigService>();

  /// Reads a config for given [key].
  String? read(String key);
}
