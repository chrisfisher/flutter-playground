import 'package:redux/redux.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/models/vehicles_state.dart';

VehiclesState vehiclesReducer(VehiclesState state, action) {
  return VehiclesState(
    vehicles: _vehicles(state.vehicles, action),
    isLoading: _isLoading(state.isLoading, action),
  );
}

final _vehicles = combineReducers<List<Vehicle>>([
  TypedReducer<List<Vehicle>, VehiclesLoadedAction>(_loadVehicles),
  TypedReducer<List<Vehicle>, VehicleAddedAction>(_addVehicle),
  TypedReducer<List<Vehicle>, VehicleUpdatedAction>(_updateVehicle),
]);

List<Vehicle> _loadVehicles(List<Vehicle> state, VehiclesLoadedAction action) {
  return action.vehicles;
}

List<Vehicle> _addVehicle(List<Vehicle> state, VehicleAddedAction action) {
  return List.from(state)..add(action.vehicle);
}

List<Vehicle> _updateVehicle(List<Vehicle> state, VehicleUpdatedAction action) {
  return state.where((vehicle) => vehicle.id != action.vehicle.id).toList()
    ..add(action.vehicle);
}

final _isLoading = combineReducers<bool>([
  TypedReducer<bool, LoadVehiclesAction>(_setIsLoading),
  TypedReducer<bool, VehiclesNotLoadedAction>(_setIsNotLoading),
  TypedReducer<bool, VehiclesLoadedAction>(_setIsNotLoading),
  TypedReducer<bool, AddVehicleAction>(_setIsLoading),
  TypedReducer<bool, VehicleAddedAction>(_setIsNotLoading),
  TypedReducer<bool, VehicleNotAddedAction>(_setIsNotLoading),
  TypedReducer<bool, UpdateVehicleAction>(_setIsLoading),
  TypedReducer<bool, VehicleUpdatedAction>(_setIsNotLoading),
  TypedReducer<bool, VehicleNotUpdatedAction>(_setIsNotLoading),
]);

bool _setIsLoading(bool state, action) => true;

bool _setIsNotLoading(bool state, action) => false;
