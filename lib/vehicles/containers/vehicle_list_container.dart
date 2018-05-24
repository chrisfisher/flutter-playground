import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/vehicles/screens/vehicle_list_screen.dart';

class VehicleListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return VehicleListScreen(
          vehicles: vm.vehicles,
          isLoading: vm.isLoading,
          loadVehicles: vm.loadVehicles,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Vehicle> vehicles;
  final bool isLoading;
  final Function loadVehicles;

  _ViewModel({
    @required this.vehicles,
    @required this.isLoading,
    @required this.loadVehicles,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      vehicles: store.state.vehicles.vehicles,
      isLoading: store.state.vehicles.isLoading,
      loadVehicles: () {
        store.dispatch(loadVehiclesThunk());
      },
    );
  }
}
