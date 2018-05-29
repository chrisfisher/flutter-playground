import 'package:flutter_playground/api/actions.dart';
import 'package:flutter_playground/operators/api.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';

class LoadOperatorsAction extends RequestAction {}

class OperatorsNotLoadedAction extends FailureAction {}

class OperatorsLoadedAction extends SuccessAction {}

loadOperatorsAction() => ApiAction(
      authenticated: true,
      request: LoadOperatorsAction(),
      success: OperatorsLoadedAction(),
      failure: OperatorsNotLoadedAction(),
      apiCall: Api.fetchOperators,
    );

class AddOperatorAction extends RequestAction {}

class OperatorNotAddedAction extends FailureAction {}

class OperatorAddedAction extends SuccessAction {}

addOperatorAction(VehicleOperator vehicleOperator) => ApiAction(
      authenticated: true,
      request: AddOperatorAction(),
      success: OperatorAddedAction(),
      failure: OperatorNotAddedAction(),
      apiCall: Api.addOperator,
      apiArgs: [vehicleOperator],
    );
