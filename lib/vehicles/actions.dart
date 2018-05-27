import 'package:redux/redux.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/api.dart';

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
      final accessToken = store.state.auth.tokenData.accessToken;
      final vehicles = await fetchVehicles(accessToken);
      store.dispatch(VehiclesLoadedAction(vehicles));
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
      final accessToken = store.state.auth.tokenData.accessToken;
      final addedVehicle = await addVehicle(accessToken, vehicle);
      store.dispatch(VehicleAddedAction(addedVehicle));
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
      final accessToken = store.state.auth.tokenData.accessToken;
      final updatedVehicle = await updateVehicle(accessToken, vehicle);
      store.dispatch(VehicleUpdatedAction(updatedVehicle));
    } catch (e) {
      store.dispatch(VehicleNotUpdatedAction());
    }
  };
}
