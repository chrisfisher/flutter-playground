import 'package:redux/redux.dart';
import 'package:flutter_playground/operators/actions.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';
import 'package:flutter_playground/operators/models/operators_state.dart';

OperatorsState operatorsReducer(OperatorsState state, action) {
  return OperatorsState(
    vehicleOperators: _vehicleOperators(state.vehicleOperators, action),
    isLoading: _isLoading(state.isLoading, action),
  );
}

final _vehicleOperators = combineReducers<List<VehicleOperator>>([
  TypedReducer<List<VehicleOperator>, OperatorsLoadedAction>(_loadOperators),
  TypedReducer<List<VehicleOperator>, OperatorAddedAction>(_addOperator),
]);

List<VehicleOperator> _loadOperators(
  List<VehicleOperator> state,
  OperatorsLoadedAction action,
) {
  return action.payload;
}

List<VehicleOperator> _addOperator(
  List<VehicleOperator> state,
  OperatorAddedAction action,
) {
  return List.from(state)..add(action.payload);
}

final _isLoading = combineReducers<bool>([
  TypedReducer<bool, LoadOperatorsAction>(_setIsLoading),
  TypedReducer<bool, OperatorsNotLoadedAction>(_setIsNotLoading),
  TypedReducer<bool, OperatorsLoadedAction>(_setIsNotLoading),
  TypedReducer<bool, AddOperatorAction>(_setIsLoading),
  TypedReducer<bool, OperatorAddedAction>(_setIsNotLoading),
  TypedReducer<bool, OperatorNotAddedAction>(_setIsNotLoading),
]);

bool _setIsLoading(bool state, action) => true;

bool _setIsNotLoading(bool state, action) => false;
