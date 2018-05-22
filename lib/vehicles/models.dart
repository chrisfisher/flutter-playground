import 'package:flutter/foundation.dart';
import 'package:flutter_playground/shared/models.dart';

class VehicleType implements MenuItem {
  final String id;
  final String title;

  VehicleType({
    @required this.id,
    @required this.title,
  });
}

@immutable
class Vehicle {
  final String id;
  final String registration;
  final VehicleType type;
  final int odometer;
  final bool odometerRequired;

  Vehicle({
    this.id,
    this.registration,
    this.type,
    this.odometer,
    this.odometerRequired,
  });
}

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
