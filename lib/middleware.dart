// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:flutter_playground/vehicles/actions.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/models.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';

typedef dynamic ThunkAction<State>(Store<State> store);

void thunkMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ThunkAction<State>) {
    return action(store);
  } else {
    next(action);
  }
}

List<Middleware<AppState>> createMiddleware() {
  return [
    TypedMiddleware<AppState, LoadVehiclesAction>(_createLoadVehicles()),
    TypedMiddleware<AppState, AddVehicleAction>(_createAddVehicle()),
    TypedMiddleware<AppState, UpdateVehicleAction>(_createUpdateVehicle()),
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

    try {
      _serverVehicles.add(action.vehicle);
      await Future.delayed(const Duration(seconds: 1));
      store.dispatch(VehicleAddedAction());
    } catch (e) {
      store.dispatch(VehicleNotAddedAction());
    }
  };
}

Middleware<AppState> _createUpdateVehicle() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    try {
      _serverVehicles
          .where((vehicle) => action.vehicle.id != vehicle.id)
          .toList()
          .add(action.vehicle);
      await Future.delayed(const Duration(seconds: 1));
      store.dispatch(VehicleUpdatedAction());
    } catch (e) {
      store.dispatch(VehicleNotUpdatedAction());
    }
  };
}

final List<Vehicle> _serverVehicles = [
  Vehicle(
    id: Uuid().v4(),
    registration: 'FGD432',
    odometer: 50123,
    odometerRequired: true,
    type: VehicleType(
      title: 'Small passenger service',
      id: 'spsv',
    ),
  ),
];
