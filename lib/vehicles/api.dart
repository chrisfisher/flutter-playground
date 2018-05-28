import 'dart:async';
import 'package:flutter_playground/api/api.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';

class Api {
  static Future<List<Vehicle>> fetchVehicles(String accessToken) async {
    final response = await get("vehicles", accessToken: accessToken);
    if (response.statusCode != 200) {
      return null;
    }
    final jsonArray = decodeJsonArray(response.body);
    final vehicles = jsonArray.map((obj) => Vehicle.fromJson(obj)).toList();
    return vehicles;
  }

  static Future<Vehicle> addVehicle(
    String accessToken,
    Vehicle vehicle,
  ) async {
    String body = encodeJson(vehicle);
    final response =
        await post("vehicles", accessToken: accessToken, body: body);
    if (response.statusCode != 201) {
      return null;
    }
    final jsonObject = decodeJsonObject(response.body);
    final addedVehicle = Vehicle.fromJson(jsonObject);
    return addedVehicle;
  }

  static Future<Vehicle> updateVehicle(
    String accessToken,
    Vehicle vehicle,
  ) async {
    String body = encodeJson(vehicle);
    final response = await put(
      "vehicles/" + vehicle.id,
      accessToken: accessToken,
      body: body,
    );
    if (response.statusCode != 200) {
      return null;
    }
    final jsonObject = decodeJsonObject(response.body);
    final updatedVehicle = Vehicle.fromJson(jsonObject);
    return updatedVehicle;
  }
}
