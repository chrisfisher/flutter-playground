import 'package:flutter/material.dart';

class ViewNotificationScreen extends StatelessWidget {
  final String notificationPayload;

  ViewNotificationScreen({this.notificationPayload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View notification")),
      body: Center(
        child: Text(notificationPayload),
      ),
    );
  }
}
