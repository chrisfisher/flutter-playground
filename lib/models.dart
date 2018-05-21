import 'package:meta/meta.dart';
import 'package:flutter_playground/vehicles/models.dart';

@immutable
class AppState {
  final VehiclesState vehicles;

  AppState({this.vehicles});

  factory AppState.initialState() => AppState(
        vehicles: VehiclesState.initialState(),
      );
}
