import 'package:flutter/foundation.dart';

@immutable
class AuthState {
  final bool isLoading;
  final String errorMessage;
  final String token;

  AuthState({
    @required this.isLoading,
    @required this.errorMessage,
    @required this.token,
  });

  factory AuthState.initialState() => AuthState(
        isLoading: false,
        errorMessage: null,
        token: null,
      );
}
