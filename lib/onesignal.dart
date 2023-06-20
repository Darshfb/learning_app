import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalHelper {
  static init() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("93b3269a-4573-4059-9708-b6afc2222bd7");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debugPrint("Accepted permission: $accepted");
    });
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
            (OSNotificationReceivedEvent event) {
          event.complete(event.notification);
          print("mostafa");
        });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // print("setNotificationOpenedHandler ${result.notification.category}");
      // print("setNotificationOpenedHandler title ${result.notification.title}");
      // print("setNotificationOpenedHandler body ${result.notification.body}");
      // print(
      //     "setNotificationOpenedHandler additionalData ${result.notification.additionalData}");



    });
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      // print("Accepted permission: $accepted");
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      if (result.notification.additionalData!.values.first == 'update') {
        // Route route = MaterialPageRoute(builder: (context) => UpdateQstnPage());
        // Navigator.push(context, route);
      } else {
        // Route route = MaterialPageRoute(
        //     builder: (context) => NotificationPage([
        //       result.notification.title,
        //       result.notification.additionalData.values.first
        //     ]));
        // Navigator.push(context, route);
      }
    });
  }

}
