import 'package:redux/redux.dart';
import 'package:flutter_playground/auth/actions.dart';
import 'package:flutter_playground/auth/models/auth_state.dart';
import 'package:flutter_playground/auth/models/token_data.dart';

AuthState authReducer(AuthState state, action) {
  return AuthState(
    errorMessage: _errorMessage(state.errorMessage, action),
    isLoading: _isLoading(state.isLoading, action),
    tokenData: _tokenData(state.tokenData, action),
  );
}

final _errorMessage = combineReducers<String>([
  TypedReducer<String, LoginUserFailureAction>(_setErrorMessage),
  TypedReducer<String, LoginUserSuccessAction>(_clearErrorMessage),
]);

String _setErrorMessage(String state, action) => action.errorMessage;

String _clearErrorMessage(String state, action) => null;

final _tokenData = combineReducers<TokenData>([
  TypedReducer<TokenData, LoginUserSuccessAction>(_setTokenData),
  TypedReducer<TokenData, LogoutAction>(_clearTokenData),
]);

TokenData _setTokenData(TokenData state, action) => action.tokenData;

TokenData _clearTokenData(TokenData state, action) => null;

final _isLoading = combineReducers<bool>([
  TypedReducer<bool, LoginUserAction>(_setIsLoading),
  TypedReducer<bool, LoginUserFailureAction>(_setIsNotLoading),
  TypedReducer<bool, LoginUserSuccessAction>(_setIsNotLoading),
]);

bool _setIsLoading(bool state, action) => true;

bool _setIsNotLoading(bool state, action) => false;
