import 'dart:async';
import 'dart:convert';
import 'package:flutter_playground/vehicles/models/mehicle.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000/";

Future<http.Response> fetch(String path) => http.get(Uri.parse(baseUrl + path));

Map decodeJsonObject(String body) => json.decode(body);

List decodeJsonArray(String body) => json.decode(body);

Future<List<Mehicle>> fetchVehicles() async {
  final response = await fetch("vehicles");
  final list = decodeJsonArray(response.body);
  final mehicles = list.map((obj) => Mehicle.fromJson(obj)).toList();
  return mehicles;
}
