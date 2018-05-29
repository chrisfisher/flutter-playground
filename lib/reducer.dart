import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/auth/reducer.dart';
import 'package:flutter_playground/vehicles/reducer.dart';
import 'package:flutter_playground/operators/reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
    vehicles: vehiclesReducer(state.vehicles, action),
    operators: operatorsReducer(state.operators, action),
  );
}
