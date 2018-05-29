import 'package:flutter_playground/api/actions.dart';
import 'package:flutter_playground/vehicles/api.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';

class LoadVehiclesAction extends RequestAction {}

class VehiclesNotLoadedAction extends FailureAction {}

class VehiclesLoadedAction extends SuccessAction {}

loadVehiclesAction() => ApiAction(
      authenticated: true,
      request: LoadVehiclesAction(),
      success: VehiclesLoadedAction(),
      failure: VehiclesNotLoadedAction(),
      apiCall: Api.fetchVehicles,
    );

class AddVehicleAction extends RequestAction {}

class VehicleNotAddedAction extends FailureAction {}

class VehicleAddedAction extends SuccessAction {}

addVehicleAction(Vehicle vehicle) => ApiAction(
      authenticated: true,
      request: AddVehicleAction(),
      success: VehicleAddedAction(),
      failure: VehicleNotAddedAction(),
      apiCall: Api.addVehicle,
      apiArgs: [vehicle],
    );

class UpdateVehicleAction extends RequestAction {}

class VehicleNotUpdatedAction extends FailureAction {}

class VehicleUpdatedAction extends SuccessAction {}

updateVehicleAction(Vehicle vehicle) => ApiAction(
      authenticated: true,
      request: UpdateVehicleAction(),
      success: VehicleUpdatedAction(),
      failure: VehicleNotUpdatedAction(),
      apiCall: Api.updateVehicle,
      apiArgs: [vehicle],
    );
