import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_playground/routes.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/auth/screens/login_screen.dart';
import 'package:flutter_playground/notifications/screens/notifications_screen.dart';
import 'package:flutter_playground/notifications/screens/view_notification_screen.dart';
import 'package:flutter_playground/notifications/notifications_manager.dart';
import 'package:flutter_playground/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_playground/vehicles/screens/vehicle_list_screen.dart';
import 'package:flutter_playground/vehicles/screens/vehicle_screen.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'dart:async';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  NotificationsManager notificationsManager;

  @override
  void initState() {
    super.initState();
    notificationsManager =
        NotificationsManager(selectNotification: _selectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(vehicles: VehiclesModel()),
      child: MaterialApp(
        title: 'Logmate',
        theme: ThemeData(
          accentColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        routes: {
          Routes.login: (context) => LoginScreen(),
          Routes.dashboard: (context) => DashboardScreen(),
          Routes.notifications: (context) =>
              NotificationsScreen(notificationsManager: notificationsManager),
          Routes.vehicles: (context) => VehicleListScreen(),
          Routes.addVehicle: (context) => VehicleScreen(
                vehicle: Vehicle(),
                isUpdating: false,
              ),
        },
      ),
    );
  }

  Future<void> _selectNotification(String payload) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ViewNotificationScreen(notificationPayload: payload),
      ),
    );
  }
}
