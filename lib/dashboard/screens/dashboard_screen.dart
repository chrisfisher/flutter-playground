import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/vehicles"),
              child: Text("Vehicles"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/operators"),
              child: Text("Operators"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/notifications"),
              child: Text("Notifications"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/location"),
              child: Text("Location"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
