import 'package:z0und/service/http.dart';

extension UriExtension on Uri {
  Future<dynamic> postJson({
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) =>
      HttpService().postJson(
        this,
        headers: headers,
        body: body,
      );

  Future<dynamic> postForm({
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    String? basicAuthUser,
    String? basicAuthPass,
  }) =>
      HttpService().postForm(
        this,
        headers: headers,
        body: body,
        basicAuthUser: basicAuthUser,
        basicAuthPass: basicAuthPass,
      );
}