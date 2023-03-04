import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  HttpHelper._();

  static Future<dynamic> postJson(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    final headersMap = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    headersMap.addAll(headers);
    final response = await http.post(
      Uri.parse(url),
      headers: headersMap,
      body: jsonEncode(body),
    );
    final responseJson = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    }
    debugPrint('Error http POST $url: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }

  static Future<dynamic> postForm(
    String url, {
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    String? basicAuthUser,
    String? basicAuthPass,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(body);
    request.headers.addAll(headers);
    if (basicAuthUser != null && basicAuthPass != null) {
      final authToken =
          base64.encode(utf8.encode('$basicAuthUser:$basicAuthPass'));
      request.headers['Authorization'] = 'Basic $authToken';
    }
    final response = await request.send();
    final responseJson = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    }
    debugPrint('Error http POST MULTIPART $url: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }
}
