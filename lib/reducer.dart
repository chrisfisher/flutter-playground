import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/vehicles/reducer.dart';
import 'package:flutter_playground/auth/reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    vehicles: vehiclesReducer(state.vehicles, action),
    auth: authReducer(state.auth, action),
  );
}