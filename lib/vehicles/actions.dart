import 'dart:async';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/models.dart';

final List<Vehicle> _serverVehicles = [
  Vehicle(
    id: Uuid().v4(),
    registration: 'FGD432',
    odometer: 50123,
    odometerRequired: true,
    type: VehicleType(
      title: 'Small passenger service',
      id: 'spsv',
    ),
  ),
];

class LoadVehiclesAction {}

class VehiclesNotLoadedAction {}

class VehiclesLoadedAction {
  final List<Vehicle> vehicles;

  VehiclesLoadedAction(this.vehicles);

  @override
  String toString() => 'VehiclesLoadedAction{vehicles: $vehicles}';
}

Function loadVehiclesThunk() {
  return (Store<AppState> store) async {
    store.dispatch(LoadVehiclesAction());
    try {
      await Future.delayed(Duration(seconds: 1));
      store.dispatch(VehiclesLoadedAction(_serverVehicles));
    } catch (e) {
      store.dispatch(VehiclesNotLoadedAction());
    }
  };
}

class AddVehicleAction {}

class VehicleNotAddedAction {}

class VehicleAddedAction {
  final Vehicle vehicle;

  VehicleAddedAction(this.vehicle);

  @override
  String toString() => 'VehicleAddedAction{vehicle: $vehicle}';
}

Function addVehicleThunk(Vehicle vehicle) {
  return (Store<AppState> store) async {
    store.dispatch(AddVehicleAction());
    try {
      _serverVehicles.add(vehicle);
      await Future.delayed(const Duration(seconds: 1));
      store.dispatch(VehicleAddedAction(vehicle));
    } catch (e) {
      store.dispatch(VehicleNotAddedAction());
    }
  };
}

class UpdateVehicleAction {}

class VehicleNotUpdatedAction {}

class VehicleUpdatedAction {
  final Vehicle vehicle;

  VehicleUpdatedAction(this.vehicle);

  @override
  String toString() => 'VehicleUpdatedAction{vehicle: $vehicle}';
}

Function updateVehicleThunk(Vehicle vehicle) {
  return (Store<AppState> store) async {
    store.dispatch(UpdateVehicleAction());
    try {
      _serverVehicles.where((v) => vehicle.id != v.id).toList().add(vehicle);
      await Future.delayed(const Duration(seconds: 1));
      store.dispatch(VehicleUpdatedAction(vehicle));
    } catch (e) {
      store.dispatch(VehicleNotUpdatedAction());
    }
  };
}
