// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () async {
                // final isAuthenticated = await _authenticate();
                // if (isAuthenticated) {
                //   Navigator.pushReplacementNamed(context, "/dashboard");
                // }
                Navigator.pushReplacementNamed(context, "/dashboard");
              },
              child: Text("Sign in with Touch ID or Face ID"),
            ),
          ],
        ),
      ),
    );
  }

  // Future<bool> _authenticate() async {
  //   final auth = LocalAuthentication();
  //   bool authenticated = false;
  //   try {
  //     authenticated = await auth.authenticateWithBiometrics(
  //       localizedReason: 'Scan your fingerprint to sign in',
  //       useErrorDialogs: true,
  //     );
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   return authenticated;
  // }
}
