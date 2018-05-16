import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_playground/shared/widgets/dropdown_field.dart';
import 'package:uuid/uuid.dart';

List<VehicleType> vehicleTypes = [
  VehicleType(id: 't', title: 'Taxi'),
  VehicleType(id: 'spsv', title: 'Small passenger service'),
  VehicleType(id: 'lpsv', title: 'Large passenger service'),
  VehicleType(id: 'mc', title: 'Mobile crane'),
  VehicleType(id: 'sb', title: 'School bus'),
  VehicleType(id: 'vrs', title: 'Vehicle recovery service'),
  VehicleType(id: 'vh', title: 'Vintage heavy'),
  VehicleType(id: 'hm', title: 'Heavy motor'),
  VehicleType(id: 'gs', title: 'Goods service'),
  VehicleType(id: 'c', title: 'Combination'),
  VehicleType(id: 'es', title: 'Emergency service'),
];

class VehicleType implements MenuItem {
  final String id;
  final String title;

  VehicleType({@required this.id, @required this.title});
}

class Vehicle {
  String id = Uuid().v4();
  String registration;
  VehicleType type;
  int odometer;
  bool odometerRequired;

  Vehicle({
    this.registration,
    this.type,
    this.odometer,
    this.odometerRequired,
  });
}

class VehiclesModel extends Model {
  VehiclesModel() {
    loadVehicles();
  }

  List<Vehicle> _vehicles;
  List<Vehicle> get vehicles => _vehicles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPosting = false;
  bool get isPosting => _isPosting;

  void loadVehicles() async {
    _isLoading = true;
    notifyListeners();

    // simulate api call
    await Future.delayed(const Duration(seconds: 1));
    _isLoading = false;
    _vehicles = _serverVehicles;
    notifyListeners();
  }

  Future<bool> addVehicle(Vehicle vehicle) async {
    _isPosting = true;
    notifyListeners();

    // simulate api call
    await Future.delayed(const Duration(seconds: 1));
    _isPosting = false;
    _vehicles.add(vehicle);
    notifyListeners();
    return true;
  }

  Future<bool> updateVehicle(Vehicle vehicle) async {
    _isPosting = true;
    notifyListeners();

    // simulate api call
    await Future.delayed(const Duration(seconds: 1));
    _isPosting = false;
    _vehicles.removeWhere((v) => v.id == vehicle.id);
    _vehicles.add(vehicle);
    notifyListeners();
    return true;
  }
}

List<Vehicle> _serverVehicles = [
  Vehicle(
    registration: 'FGD432',
    odometer: 50123,
    odometerRequired: true,
    type: VehicleType(
      title: 'Small passenger service',
      id: 'spsv',
    ),
  ),
];
