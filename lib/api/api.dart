import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_playground/config.dart';

Uri buildUri(String path) => Uri.parse(AppConfig.apiBaseUrl + path);

Map<String, String> buildHeaders(String accessToken) {
  Map<String, String> headers = {
    "Content-type": "application/json",
  };
  if (accessToken != null) {
    headers["Authorization"] = "Bearer " + accessToken;
  }
  return headers;
}

Future<http.Response> get(String path, {String accessToken}) async {
  await Future.delayed(const Duration(seconds: 1));
  Uri uri = buildUri(path);
  Map<String, String> headers = buildHeaders(accessToken);
  http.Response response = await http.get(uri, headers: headers);
  return response;
}

Future<http.Response> post(
  String path, {
  String accessToken,
  String body,
}) async {
  await Future.delayed(const Duration(seconds: 1));
  Uri uri = buildUri(path);
  Map<String, String> headers = buildHeaders(accessToken);
  http.Response response = await http.post(uri, body: body, headers: headers);
  return response;
}

Future<http.Response> put(
  String path, {
  String accessToken,
  String body,
}) async {
  await Future.delayed(const Duration(seconds: 1));
  Uri uri = buildUri(path);
  Map<String, String> headers = buildHeaders(accessToken);
  http.Response response = await http.put(uri, body: body, headers: headers);
  return response;
}

String encodeJson(Object obj) => json.encode(obj);

Map decodeJsonObject(String body) => json.decode(body);

List decodeJsonArray(String body) => json.decode(body);
