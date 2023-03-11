import '../ioc.dart';

abstract class HttpService {
  factory HttpService() => Ioc.get<HttpService>();

  Future<dynamic> postJson(
    Uri uri, {
    String? authBearer,
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  });

  Future<dynamic> postForm(
    Uri uri, {
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    String? basicAuthUser,
    String? basicAuthPass,
  });
}
