import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_playground/vehicles/screens/vehicle_screen.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/models.dart';

class VehicleContainer extends StatelessWidget {
  final bool isUpdating;
  final Vehicle vehicle;

  VehicleContainer({
    @required this.isUpdating,
    this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return VehicleScreen(
          vehicle: vehicle,
          isUpdating: isUpdating,
          isLoading: vm.isLoading,
          updateVehicle: vm.updateVehicle,
          addVehicle: vm.addVehicle,
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final Function addVehicle;
  final Function updateVehicle;

  _ViewModel({
    @required this.isLoading,
    @required this.addVehicle,
    @required this.updateVehicle,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.vehicles.isLoading,
      addVehicle: (Vehicle vehicle) {
        store.dispatch(addVehicleAction(vehicle));
      },
      updateVehicle: (Vehicle vehicle) {
        store.dispatch(updateVehicleAction(vehicle));
      },
    );
  }
}
