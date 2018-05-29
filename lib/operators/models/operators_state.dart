import 'package:flutter/foundation.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';

@immutable
class OperatorsState {
  final List<VehicleOperator> vehicleOperators;
  final bool isLoading;

  OperatorsState({
    @required this.vehicleOperators,
    @required this.isLoading,
  });

  factory OperatorsState.initialState() => OperatorsState(
        vehicleOperators: [],
        isLoading: false,
      );
}
