import 'package:redux/redux.dart';
import 'package:flutter_playground/auth/actions.dart';
import 'package:flutter_playground/auth/models/auth_state.dart';

AuthState authReducer(AuthState state, action) {
  return AuthState(
    errorMessage: _errorMessage(state.errorMessage, action),
    isLoading: _isLoading(state.isLoading, action),
    token: _token(state.token, action),
  );
}

final _errorMessage = combineReducers<String>([
  TypedReducer<String, LoginUserFailureAction>(_setErrorMessage),
  TypedReducer<String, LoginUserSuccessAction>(_clearErrorMessage),
]);

String _setErrorMessage(String state, action) => action.errorMessage;

String _clearErrorMessage(String state, action) => null;

final _token = combineReducers<String>([
  TypedReducer<String, LoginUserSuccessAction>(_setToken),
  TypedReducer<String, LogoutAction>(_clearToken),
]);

String _setToken(String state, action) => action.token;

String _clearToken(String state, action) => null;

final _isLoading = combineReducers<bool>([
  TypedReducer<bool, LoginUserAction>(_setIsLoading),
  TypedReducer<bool, LoginUserFailureAction>(_setIsNotLoading),
  TypedReducer<bool, LoginUserSuccessAction>(_setIsNotLoading),
]);

bool _setIsLoading(bool state, action) => true;

bool _setIsNotLoading(bool state, action) => false;
