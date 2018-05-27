import 'package:flutter_playground/vehicles/models/vehicle.dart';

class LoadVehiclesAction {}

class VehiclesNotLoadedAction {}

class VehiclesLoadedAction {
  final List<Vehicle> vehicles;

  VehiclesLoadedAction(this.vehicles);

  @override
  String toString() => 'VehiclesLoadedAction{vehicles: $vehicles}';
}

class AddVehicleAction {}

class VehicleNotAddedAction {}

class VehicleAddedAction {
  final Vehicle vehicle;

  VehicleAddedAction(this.vehicle);

  @override
  String toString() => 'VehicleAddedAction{vehicle: $vehicle}';
}

class UpdateVehicleAction {}

class VehicleNotUpdatedAction {}

class VehicleUpdatedAction {
  final Vehicle vehicle;

  VehicleUpdatedAction(this.vehicle);

  @override
  String toString() => 'VehicleUpdatedAction{vehicle: $vehicle}';
}
