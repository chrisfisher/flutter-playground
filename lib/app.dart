import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_playground/routes.dart';
import 'package:flutter_playground/auth/screens/login_screen.dart';
import 'package:flutter_playground/location/screens/location_screen.dart';
import 'package:flutter_playground/notifications/screens/notifications_screen.dart';
import 'package:flutter_playground/notifications/screens/view_notification_screen.dart';
import 'package:flutter_playground/notifications/notifications_manager.dart';
import 'package:flutter_playground/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_playground/vehicles/containers/vehicle_list_container.dart';
import 'package:flutter_playground/vehicles/containers/vehicle_container.dart';

import 'package:flutter_playground/reducer.dart';
import 'package:flutter_playground/middleware.dart';
import 'package:flutter_playground/models.dart';

class LogmateApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogmateAppState();
}

class LogmateAppState extends State<LogmateApp> {
  NotificationsManager notificationsManager;

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: createMiddleware(),
  );

  @override
  void initState() {
    super.initState();
    notificationsManager =
        NotificationsManager(selectNotification: _selectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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
          Routes.vehicles: (context) => VehicleListContainer(),
          Routes.addVehicle: (context) => VehicleContainer(isUpdating: false),
          Routes.location: (context) => LocationScreen(),
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
