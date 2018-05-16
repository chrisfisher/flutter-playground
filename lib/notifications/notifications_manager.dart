import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/initialization_settings.dart';
import 'package:flutter_local_notifications/notification_details.dart';
import 'package:flutter_local_notifications/platform_specifics/android/initialization_settings_android.dart';
import 'package:flutter_local_notifications/platform_specifics/android/notification_details_android.dart';
import 'package:flutter_local_notifications/platform_specifics/ios/initialization_settings_ios.dart';
import 'package:flutter_local_notifications/platform_specifics/ios/notification_details_ios.dart';

const channelId = "com.logmate.notifications";
const channelName = "Logmate";
const channelDescription = "Logmate Notifications";

class NotificationsManager {
  FlutterLocalNotificationsPlugin _localNotifications;
  NotificationDetails _notificationDetails;

  NotificationsManager({Function selectNotification}) {
    _localNotifications = FlutterLocalNotificationsPlugin();

    final androidSettings = InitializationSettingsAndroid('app_icon');
    final iosSettings = InitializationSettingsIOS();
    final settings = InitializationSettings(androidSettings, iosSettings);

    _localNotifications.initialize(
      settings,
      selectNotification: selectNotification,
    );

    _notificationDetails = NotificationDetails(
      NotificationDetailsAndroid(channelId, channelName, channelDescription),
      NotificationDetailsIOS(),
    );
  }

  void show({int id, String title, String body}) async {
    await _localNotifications.show(
      id,
      title,
      body,
      _notificationDetails,
    );
  }

  void schedule({int id, String title, String body, DateTime time}) async {
    await _localNotifications.schedule(
      id,
      title,
      body,
      time,
      _notificationDetails,
    );
  }

  void cancel({int id}) async {
    await _localNotifications.cancel(id);
  }

  void cancelAll() async {
    await _localNotifications.cancelAll();
  }
}
