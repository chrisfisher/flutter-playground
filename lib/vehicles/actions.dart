import 'package:flutter_playground/vehicles/models.dart';

class LoadVehiclesAction {}

class VehiclesNotLoadedAction {}

class VehiclesLoadedAction {
  final List<Vehicle> vehicles;

  VehiclesLoadedAction(this.vehicles);

  @override
  String toString() => 'VehiclesLoadedAction{vehicles: $vehicles}';
}

class AddVehicleAction {
  final Vehicle vehicle;

  AddVehicleAction(this.vehicle);

  @override
  String toString() => 'AddVehicleAction{vehicle: $vehicle}';
}

class VehicleNotAddedAction {}

class VehicleAddedAction {}

class UpdateVehicleAction {
  final Vehicle vehicle;

  UpdateVehicleAction(this.vehicle);

  @override
  String toString() => 'UpdateVehicleAction{vehicle: $vehicle}';
}

class VehicleNotUpdatedAction {}

class VehicleUpdatedAction {}
