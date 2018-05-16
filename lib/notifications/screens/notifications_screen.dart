import 'package:flutter/material.dart';
import 'package:flutter_playground/notifications/notifications_manager.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsManager notificationsManager;

  NotificationsScreen({this.notificationsManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                const title = "Immediate notification";
                const body = "This notification has been shown immediately.";
                notificationsManager.show(id: 0, title: title, body: body);
              },
              child: Text("Show notification"),
            ),
            RaisedButton(
              onPressed: () {
                const title = "Scheduled notification";
                const body = "5 seconds has passed.";
                final time = DateTime.now().add(Duration(seconds: 5));
                notificationsManager.schedule(
                  id: 1,
                  title: title,
                  body: body,
                  time: time,
                );
              },
              child: Text("Schedule notification"),
            ),
            RaisedButton(
              onPressed: () {
                notificationsManager.cancel(id: 1);
              },
              child: Text("Cancel scheduled"),
            ),
            RaisedButton(
              onPressed: () {
                notificationsManager.cancelAll();
              },
              child: Text("Cancel all"),
            ),
          ],
        ),
      ),
    );
  }
}
