import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:z0und/helper/string.dart';

extension UriExtension on Uri {
  Future<dynamic> postJson({
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    final headersMap = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    headersMap.addAll(headers);
    final bodyJson = jsonEncode(body);
    final response = await http.post(this, headers: headersMap, body: bodyJson);
    final responseJson = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    }
    debugPrint('http POST ${toString()}: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }

  Future<dynamic> postForm({
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    String? basicAuthUser,
    String? basicAuthPass,
  }) async {
    final request = http.MultipartRequest('POST', this);
    request.fields.addAll(body);
    request.headers.addAll(headers);
    if (basicAuthUser != null && basicAuthPass != null) {
      final basicAuth = '$basicAuthUser:$basicAuthPass';
      request.headers['Authorization'] = 'Basic ${basicAuth.encodeBase64()}';
    }
    final response = await request.send();
    final responseJson = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    }
    debugPrint(' http POST MULTIPART ${toString()}: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }
}
