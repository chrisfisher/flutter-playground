import 'package:meta/meta.dart';
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
