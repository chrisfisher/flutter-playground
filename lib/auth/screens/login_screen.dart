import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatelessWidget {
  final Function loginUser;
  final String errorMessage;
  final bool isLoading;

  LoginScreen({
    @required this.loginUser,
    @required this.errorMessage,
    @required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      loginUser(
                          username: "Bob",
                          password: "1234",
                          onSuccess: () {
                            Navigator.pushNamed(context, "/dashboard");
                          });
                    },
                    child: Text("Sign in"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      final isAuthenticated = await _authenticate();
                      if (isAuthenticated) {
                        Navigator.pushNamed(context, "/dashboard");
                      }
                    },
                    child: Text("Sign in with Touch ID or Face ID"),
                  ),
                ],
              ),
      ),
    );
  }

  Future<bool> _authenticate() async {
    final auth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to sign in',
        useErrorDialogs: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return authenticated;
  }
}
