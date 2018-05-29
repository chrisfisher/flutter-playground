import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';
import 'package:flutter_playground/operators/screens/operator_list_screen.dart';
import 'package:flutter_playground/operators/actions.dart';
import 'package:flutter_playground/operators/api.dart';
import 'package:flutter_playground/api/actions.dart';

class OperatorListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return OperatorListScreen(
          vehicleOperators: vm.vehicleOperators,
          isLoading: vm.isLoading,
          loadOperators: vm.loadOperators,
        );
      },
    );
  }
}

class _ViewModel {
  final List<VehicleOperator> vehicleOperators;
  final bool isLoading;
  final Function loadOperators;

  _ViewModel({
    @required this.vehicleOperators,
    @required this.isLoading,
    @required this.loadOperators,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      vehicleOperators: store.state.operators.vehicleOperators,
      isLoading: store.state.operators.isLoading,
      loadOperators: () {
        store.dispatch(
          ApiAction(
            authenticated: true,
            request: LoadOperatorsAction(),
            success: OperatorsLoadedAction(),
            failure: OperatorsNotLoadedAction(),
            apiCall: Api.fetchOperators,
          ),
        );
      },
    );
  }
}
