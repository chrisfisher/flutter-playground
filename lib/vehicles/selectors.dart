import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/models.dart';

List<Vehicle> getVehicles(AppModel model) => model.vehicles.vehicles;

bool getIsPosting(AppModel model) => model.vehicles.isPosting;
