import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_playground/auth/thunks.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/auth/screens/login_screen.dart';

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LoginScreen(
          loginUser: vm.loginUser,
          errorMessage: vm.errorMessage,
          isLoading: vm.isLoading,
        );
      },
    );
  }
}

class _ViewModel {
  final Function loginUser;
  final String errorMessage;
  final bool isLoading;

  _ViewModel({
    @required this.loginUser,
    @required this.errorMessage,
    @required this.isLoading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loginUser: ({
        String username,
        String password,
        Function onSuccess,
      }) {
        store.dispatch(
          loginUserThunk(
            username: username,
            password: password,
            onSuccess: onSuccess,
          ),
        );
      },
      errorMessage: store.state.auth.errorMessage,
      isLoading: store.state.auth.isLoading,
    );
  }
}
