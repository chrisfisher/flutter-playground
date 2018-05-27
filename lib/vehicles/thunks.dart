import 'package:redux/redux.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/auth/selectors.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/api.dart';

Function loadVehiclesThunk() {
  return (Store<AppState> store) async {
    store.dispatch(LoadVehiclesAction());
    try {
      final accessToken = getAccessToken(store.state);
      final vehicles = await Api.fetchVehicles(accessToken);
      store.dispatch(VehiclesLoadedAction(vehicles));
    } catch (e) {
      store.dispatch(VehiclesNotLoadedAction());
    }
  };
}

Function addVehicleThunk(Vehicle vehicle) {
  return (Store<AppState> store) async {
    store.dispatch(AddVehicleAction());
    try {
      final accessToken = getAccessToken(store.state);
      final addedVehicle = await Api.addVehicle(accessToken, vehicle);
      store.dispatch(VehicleAddedAction(addedVehicle));
    } catch (e) {
      store.dispatch(VehicleNotAddedAction());
    }
  };
}

Function updateVehicleThunk(Vehicle vehicle) {
  return (Store<AppState> store) async {
    store.dispatch(UpdateVehicleAction());
    try {
      final accessToken = getAccessToken(store.state);
      final updatedVehicle = await Api.updateVehicle(accessToken, vehicle);
      store.dispatch(VehicleUpdatedAction(updatedVehicle));
    } catch (e) {
      store.dispatch(VehicleNotUpdatedAction());
    }
  };
}
