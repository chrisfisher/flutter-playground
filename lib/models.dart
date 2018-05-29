import 'package:meta/meta.dart';
import 'package:flutter_playground/auth/models/auth_state.dart';
import 'package:flutter_playground/vehicles/models/vehicles_state.dart';
import 'package:flutter_playground/operators/models/operators_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final VehiclesState vehicles;
  final OperatorsState operators;

  AppState({
    this.auth,
    this.vehicles,
    this.operators,
  });

  factory AppState.initialState() => AppState(
        auth: AuthState.initialState(),
        vehicles: VehiclesState.initialState(),
        operators: OperatorsState.initialState(),
      );
}
