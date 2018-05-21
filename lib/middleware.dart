// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/models.dart';
import 'dart:async';

List<Middleware<AppState>> createMiddleware() {
  return [
    TypedMiddleware<AppState, LoadVehiclesAction>(_createLoadVehicles()),
    TypedMiddleware<AppState, LoadVehiclesAction>(_createAddVehicle()),
  ];
}

Middleware<AppState> _createLoadVehicles() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    try {
      await Future.delayed(const Duration(seconds: 1));
      store.dispatch(VehiclesLoadedAction(_serverVehicles));
    } catch (e) {
      store.dispatch(VehiclesNotLoadedAction());
    }
  };
}

Middleware<AppState> _createAddVehicle() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    await Future.delayed(const Duration(seconds: 1));

    _serverVehicles.add(action.vehicle);
  };
}

final List<Vehicle> _serverVehicles = [
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
