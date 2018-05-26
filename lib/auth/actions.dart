import 'dart:async';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/api.dart';
import 'package:flutter_playground/auth/models/token_request.dart';
import 'package:flutter_playground/auth/models/token_data.dart';

class LoginUserAction {}

class LoginUserSuccessAction {
  final String username;
  final TokenData tokenData;

  LoginUserSuccessAction({@required this.username, @required this.tokenData});

  @override
  String toString() => 'LoginUserSuccessAction{tokenData: $tokenData}';
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
      final request = TokenRequest(
        clientId: "ccb40da5-0dc8-440e-b69a-fa4082f1883d",
        clientSecret: "83ef5537-a664-46b9-8837-2d01c1669e15",
        grantType: "password",
        username: "duncan@employed.com",
        password: "password",
      );
      TokenData tokenData = await authorize(request);
      await Future.delayed(Duration(seconds: 1));
      store.dispatch(
          LoginUserSuccessAction(username: username, tokenData: tokenData));
      onSuccess();
    } catch (e) {
      store.dispatch(LoginUserFailureAction(errorMessage: "Uh oh"));
    }
  };
}
