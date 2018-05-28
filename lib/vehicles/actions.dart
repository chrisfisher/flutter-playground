import 'package:flutter_playground/api/actions.dart';

class LoadVehiclesAction extends RequestAction {}

class VehiclesNotLoadedAction extends FailureAction {}

class VehiclesLoadedAction extends SuccessAction {}

class AddVehicleAction extends RequestAction {}

class VehicleNotAddedAction extends FailureAction {}

class VehicleAddedAction extends SuccessAction {}

class UpdateVehicleAction extends RequestAction {}

class VehicleNotUpdatedAction extends FailureAction {}

class VehicleUpdatedAction extends SuccessAction {}
