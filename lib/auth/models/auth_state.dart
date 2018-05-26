import 'package:flutter/foundation.dart';
import 'package:flutter_playground/auth/models/token_data.dart';

@immutable
class AuthState {
  final bool isLoading;
  final String errorMessage;
  final TokenData tokenData;

  AuthState({
    @required this.isLoading,
    @required this.errorMessage,
    @required this.tokenData,
  });

  factory AuthState.initialState() => AuthState(
        isLoading: false,
        errorMessage: null,
        tokenData: null,
      );
}
