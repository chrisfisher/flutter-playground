import 'dart:async';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_playground/models.dart';

class LoginUserAction {}

class LoginUserSuccessAction {
  final String username;
  final String token;

  LoginUserSuccessAction({@required this.username, @required this.token});

  @override
  String toString() => 'LoginUserSuccessAction{token: $token}';
}

class LoginUserFailureAction {
  final String errorMessage;

  LoginUserFailureAction({this.errorMessage});

  @override
  String toString() => 'LoginUserFailureAction{errorMessage: $errorMessage}';
}

class LogoutAction {}

Function loginUserThunk({
  String username,
  String password,
  Function onSuccess,
}) {
  return (Store<AppState> store) async {
    store.dispatch(LoginUserAction());
    try {
      await Future.delayed(Duration(seconds: 1));
      store.dispatch(LoginUserSuccessAction(username: username, token: "123"));
      onSuccess();
    } catch (e) {
      store.dispatch(LoginUserFailureAction(errorMessage: "Uh oh"));
    }
  };
}
