import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../helper/string.dart';
import '../http.dart';

class FlutterHttpService implements HttpService {
  FlutterHttpService.create();

  @override
  Future<dynamic> postJson(
    Uri uri, {
    String? authBearer,
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    final headersMap = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (authBearer != null) {
      headersMap['Authorization'] = 'Bearer $authBearer';
    }
    headersMap.addAll(headers);
    final bodyJson = jsonEncode(body);
    final response = await http.post(uri, headers: headersMap, body: bodyJson);
    final responseJson = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    }
    debugPrint('http POST ${uri.toString()}: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }

  @override
  Future<dynamic> postForm(
    Uri uri, {
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    String? basicAuthUser,
    String? basicAuthPass,
  }) async {
    final request = http.MultipartRequest('POST', uri);
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
    debugPrint(
        ' http POST MULTIPART ${uri.toString()}: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase} : $responseJson');
    throw Exception('Failed TODO'); // todo
  }

  @override
  Future<Stream<List<int>>> getStream(Uri uri) async {
    final response = await http.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Stream<List<int>>.value(response.bodyBytes);
    }
    debugPrint(' http GET STREAM ${uri.toString()}: ${response.statusCode}');
    debugPrint('---- ${response.reasonPhrase}');
    throw Exception('Failed TODO'); // todo
  }
}
