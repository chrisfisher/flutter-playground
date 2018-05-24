import 'package:flutter/foundation.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';

@immutable
class VehiclesState {
  final List<Vehicle> vehicles;
  final bool isLoading;

  VehiclesState({@required this.vehicles, @required this.isLoading});

  factory VehiclesState.initialState() => VehiclesState(
        vehicles: [],
        isLoading: false,
      );
}
