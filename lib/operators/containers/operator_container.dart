import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_playground/operators/screens/operator_screen.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';
import 'package:flutter_playground/operators/api.dart';
import 'package:flutter_playground/operators/actions.dart';
import 'package:flutter_playground/api/actions.dart';
import 'package:flutter_playground/models.dart';

class OperatorContainer extends StatelessWidget {
  final VehicleOperator vehicleOperator;

  OperatorContainer({
    this.vehicleOperator,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return OperatorScreen(
          vehicleOperator: vehicleOperator,
          isLoading: vm.isLoading,
          addOperator: vm.addOperator,
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final Function addOperator;

  _ViewModel({
    @required this.isLoading,
    @required this.addOperator,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.operators.isLoading,
      addOperator: (VehicleOperator vehicleOperator) {
        store.dispatch(
          ApiAction(
            authenticated: true,
            request: AddOperatorAction(),
            success: OperatorAddedAction(),
            failure: OperatorNotAddedAction(),
            apiCall: Api.addOperator,
            apiArgs: [vehicleOperator],
          ),
        );
      },
    );
  }
}
