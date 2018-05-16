import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_playground/vehicles/models.dart';

class AppModel extends Model {
  final VehiclesModel vehicles;

  AppModel({this.vehicles});

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void init() async {
    await Future.delayed(const Duration(seconds: 1));
    _isLoading = false;
  }
}
