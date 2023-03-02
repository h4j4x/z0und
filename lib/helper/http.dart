import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  HttpHelper._();

  static Future<dynamic> postJson(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> data = const {},
  }) async {
    final headersMap = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    headersMap.addAll(headers);
    final response = await http.post(
      Uri.parse(url),
      headers: headersMap,
      body: jsonEncode(data),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }
    throw Exception('Failed TODO'); // todo
  }
}
