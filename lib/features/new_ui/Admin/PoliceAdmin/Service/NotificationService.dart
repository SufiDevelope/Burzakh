import 'dart:convert'; // Required for json.decode
import 'dart:developer';
import 'dart:io';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/UI/police_admin_dashboard_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as gauth;

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // Optional: Log message
  log('📩 Handling a background message: ${message.data["callID"]}');

  // You need to show a notification manually
  // final service = NotificationService();
  // service.showBackgroundNotification(message);
}

class NotificationService {
  //initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        print("notification payload: ${message.data}");
        if (notification != null) {
          print("notifications title: ${notification.title}");
          print("notifications body: ${notification.body}");
          if (android != null) {
            print("count: ${android.count}");
          }
        } else {
          print("No notification block, only data payload received.");
        }
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  Future<void> showBackgroundNotification(RemoteMessage message) async {
    try {
      String? title = message.notification?.title ?? message.data['title'];
      String? body = message.notification?.body ??
          message.data['body'] ??
          message.data['message'];

      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'default_channel',
        'General Notifications',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );

      const DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        message.hashCode,
        title,
        body,
        notificationDetails,
      );
    } catch (e) {
      log("❌ Error showing background notification: $e");
    }
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  Future<String?> getAccessToken() async {
    // Your service account JSON as a Dart Map
    final serviceAccountjson = {
      "type": "service_account",
      "project_id": "burzakh-5a5a8",
      "private_key_id": "a66cfe853e25ac2f3da933c934bc2efd0a2a88e2",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDJCs5RTEFaT+Da\nvQiwzHsApfzGTQKd/X+JS6amPAoBeLtSskK12D+Avn4z/7ImXug+u/xB81ktHEy1\niL5I9+cE+aiyf5FjluOAMSGO1ptfjJSgHYS6ggCg8pwY68iUynLMl0Ne3vS2jHIS\n+PlRXv5SC+y7BQcvqexj4+6IwB1xfsSGhvONPeD7ac1iOmQiaw5WDbzpCGK2fd5I\nYHM59nvtBSek0e9pfhkIJu+/MfmDdxU/AiRy6CY6v/oolU4WxlcOaKRejioMULOp\nffSIcrPCYTT+vksX04r6bfFWwyWOHWYz+8zFRLqgh+PHAf4P9nVd/cpJai+FNlD1\nUTcOpo9NAgMBAAECggEAHtUkbT13rGUhxApHwe2qU6AhUzxOUXKmU6Uhis8cbbtZ\nZ0ZlisP+gT011724UcAueCiWeHrcy1lSvmiZXlF+wbmUUMPVxWNHwspGLkTlkVLb\nHG9KgtwbQpPSstO+cGtYDd6I+4zQFQsXF6fNfNhHwseHZ+tOfdXepjc3xwtHuLcF\nUYaV/aIp8jRHBtwAPe4Sskch4M4ahroEcV616HuNjU3pbwm3b9dMQfrvrRtNqoF9\nKwaySIa0z8C23OMkQ/HzfhPiwd9eb627PHeEc/btfgjiECDQqWVxIG8lhi4kGFL/\nXJwu922aJpNBc/a3xL3xT/76N3EffPmeY+09rYjdoQKBgQD/qBTIdLdMgqvsLd/c\nVS5L8lUGcVuLl6AnP5P/eSR3hosNTJ9t4+ZUX7wAe0JYrU9sVSWejnKj3Bf6rRgL\nPl7RK653AYXS8R5/N+vUuHdsGOhj8nkyZmIyCM7mAw1sir2BDNCdYO+UNkwDEW3z\ngSdOQDtUT6e6R1DDqpDEV3jnmQKBgQDJT/F0aywYbEFzzpMLyh85OV5+YkfeTrXm\noMzgySmvNNlxtU/pbPhSpYje6ZgX439PjSDTcXY2vME/ptbcbYa8+gxZE4XMUYUC\npQBPWlNRhRdQhoeNpX6hJ5xle5rEsS4ica4pxd5eRDJZ6nmvvsbZINwNiZsozbK6\n0ZMLhDLl1QKBgQCuEnTsNERmTQbgji/BpyIZxgvMkjyh5IDAmJKdvY9t7ucZDBX1\nzdoTkwfAUCzRklfkzGkL97PpDEArh9Y6OaJ3y8VD9H55LYH1X08tDNkLej4pZ3zM\nK1gq90Jg7K0kPadgiig1MD6QbRP+dsylo0fvCN8cvgvXUx2TzLw7Y8/H6QKBgGlp\nqAiK+fsL7LYETHFW9ESVqspJElLxKkTKnJ10GJS6+sWU6HRVcC5uqZ33+YFAyfBQ\n+QhfGESPUC3RYh7oZy5bTM3z8BLN+PUqi2AB7zD3nP64gxCDwSwHvthRAfjOwlac\n6lLLXqZD1Y3JvtBs+FjH4RJhpNKX62fxx6q3HaPFAoGBAPRWUXzstvrFtZ/YaSQl\n2WiJHM78QMOiHL8LCInsjP7Me3AYgwtq6qy1gu0zjyVkq5QypU9CE3x/Nvnvy9lS\nGIeXW2jKShMNt+q9XRmADcBSxZEPO1zYa5uUpd0rosU9FC7Tma0g8uwI7L51lv5Q\nEa9pPNkkgGV1wH2r/rYXJeWd\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@burzakh-5a5a8.iam.gserviceaccount.com",
      "client_id": "117432026965682841016",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40burzakh-5a5a8.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
      // "https://www.googleapis.com/auth/userinfo.email", // Not typically needed for FCM sending
      // "https://www.googleapis.com/auth/firebase.database", // Not typically needed for FCM sending
    ];

    try {
      final credentials =
          gauth.ServiceAccountCredentials.fromJson(serviceAccountjson);

      final client = await gauth.clientViaServiceAccount(credentials, scopes);
      final accessToken = client.credentials.accessToken.data;

      print("Generated Access Token: $accessToken");
      client.close();

      return accessToken;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  /// Get the current device token
  Future<String?> getDeviceToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      return token;
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }

  /// Show local notification (when app is in foreground)
  Future<void> showNotification(RemoteMessage message) async {
    try {
      log("Call ID When the user is in foreground: ${message.data['callID']}");
      // Check if message has a notification block
      String? title = message.notification?.title;
      String? body = message.notification?.body;

      // If notification is null, fallback to data payload
      if (title == null || body == null) {
        title = message.data['title'] ?? "New Alert";
        body = message.data['message'] ??
            message.data['body'] ??
            "You have a new notification";
      }

      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'default_channel',
        'General Notifications',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );

      const DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
      );

      Future.delayed(Duration.zero, () {
        _flutterLocalNotificationsPlugin.show(
          message.hashCode,
          title,
          body,
          notificationDetails,
        );
      });
    } catch (e) {
      log("Error showing notification: $e");
    }
  }

  Future<void> sendNotification(
    String title,
    String body,
    String token, {
    String? callID,
    String? userName,
    String? receiverID,
  }) async {
    final accessToken = await getAccessToken();
    if (accessToken == null) {
      print("Failed to get access token");
      return;
    }

    final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/burzakh-5a5a8/messages:send');
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final message = {
      'token': token,
      'notification': {
        'title': title,
        'body': body,
      },
    };

    if (callID != null && userName != null) {
      message['data'] = {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "callID": callID,
        "userName": userName,
      };
    }

    final payload = {
      'message': message,
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(payload));

    if (response.statusCode == 200) {
      log("Notification sent successfully");
    } else {
      log("Failed to send notification. Status code: ${response.statusCode}");
      log("Response body: ${response.body}");
    }
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    } else {
      log("initial message is null");
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      log("message opened app");
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    log("Call Id When the user Clicked on notification: ${message.data['callID']}");
    if (message.data['callID'] != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            callID: message.data['callID'],
            userName: message.data['userName'],
            isCaller: false,
            receiverID: "123",
          ),
        ),
      );
    }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
