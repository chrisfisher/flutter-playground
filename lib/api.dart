import 'dart:async';
import 'dart:convert';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/auth/models/token_request.dart';
import 'package:flutter_playground/auth/models/token_data.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:8081/api/v1/";

Uri buildUri(String path) => Uri.parse(baseUrl + path);

Future<http.Response> get(String path, {String accessToken}) async {
  await Future.delayed(const Duration(seconds: 1));
  Uri uri = buildUri(path);
  Map<String, String> headers = {};
  if (accessToken != null) {
    headers["Authorization"] = "Bearer " + accessToken;
  }
  return http.get(uri, headers: headers);
}

Future<http.Response> post(
  String path, {
  String accessToken,
  String body,
}) async {
  await Future.delayed(const Duration(seconds: 1));
  Uri uri = Uri.parse(baseUrl + path);
  Map<String, String> headers = {
    "Content-type": "application/json",
  };
  if (accessToken != null) {
    headers["Authorization"] = "Bearer " + accessToken;
  }
  return http.post(uri, body: body, headers: headers);
}

String encodeJson(Object obj) => json.encode(obj);

Map decodeJsonObject(String body) => json.decode(body);

List decodeJsonArray(String body) => json.decode(body);

Future<TokenData> authorize(TokenRequest request) async {
  String body = encodeJson(request);
  final response = await post("oauth/token", body: body);
  final jsonObj = decodeJsonObject(response.body);
  final tokenData = TokenData.fromJson(jsonObj);
  return tokenData;
}

Future<List<Vehicle>> fetchVehicles(String accessToken) async {
  final response = await get("vehicles", accessToken: accessToken);
  if (response.statusCode != 200) {
    return null;
  }
  final jsonArray = decodeJsonArray(response.body);
  final vehicles = jsonArray.map((obj) => Vehicle.fromJson(obj)).toList();
  return vehicles;
}

Future<Vehicle> addVehicle(String accessToken, Vehicle vehicle) async {
  String body = encodeJson(vehicle);
  final response = await post("vehicles", accessToken: accessToken, body: body);
  if (response.statusCode != 200) {
    return null;
  }
  final jsonObject = decodeJsonObject(response.body);
  final addedVehicle = Vehicle.fromJson(jsonObject);
  return addedVehicle;
}
