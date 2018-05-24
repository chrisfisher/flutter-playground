import 'package:meta/meta.dart';
import 'package:flutter_playground/vehicles/models/vehicles_state.dart';
import 'package:flutter_playground/auth/models.dart';

@immutable
class AppState {
  final VehiclesState vehicles;
  final AuthState auth;

  AppState({
    this.vehicles,
    this.auth,
  });

  factory AppState.initialState() => AppState(
        vehicles: VehiclesState.initialState(),
        auth: AuthState.initialState(),
      );
}
