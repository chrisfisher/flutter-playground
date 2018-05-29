import 'dart:async';
import 'package:flutter_playground/api/api.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';

class Api {
  static Future<List<VehicleOperator>> fetchOperators(
    String accessToken,
  ) async {
    final response = await get("vehicle_operators", accessToken: accessToken);
    if (response.statusCode != 200) {
      return null;
    }
    final jsonArray = decodeJsonArray(response.body);
    final vehicleOperators =
        jsonArray.map((obj) => VehicleOperator.fromJson(obj)).toList();
    return vehicleOperators;
  }

  static Future<VehicleOperator> addOperator(
    String accessToken,
    VehicleOperator vehicleOperator,
  ) async {
    String body = encodeJson(vehicleOperator);
    final response = await post(
      "vehicle_operators",
      accessToken: accessToken,
      body: body,
    );
    if (response.statusCode != 201) {
      return null;
    }
    final jsonObject = decodeJsonObject(response.body);
    final addedOperator = VehicleOperator.fromJson(jsonObject);
    return addedOperator;
  }
}
