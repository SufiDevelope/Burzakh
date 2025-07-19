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
      "private_key_id": "03b115386b47752a85fe6fbe3bcdfd9e8e5cbdd3",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDaEk7l1Ipc6HRG\nXuBcsVYYNS81MMazF/ryiXWnBGEH9Ky41JT3i/xeJfKasC6vZMFfMOsdIn0gTQt6\nCIpRf8RxeHhwDnSAZ06MZ25fkfX0hVza4O/wsMLjHVFAh10yY298xhvC4UT0p6AN\nl7rJB27xyEefcz6D7mvSfpNAbesB6N+iECki+4qOvWNXtFEc+KfJhI/gSHI+MuXe\nFeEaD/aaszQQJpJZRdWWGdEmfvNGZyK459YDHZ7aGapW9TxvxFZoRcKeQwS+s2Sp\nwLAnKqQ83PE6BCMHOuHBUkHOHsx4f96IbVbFlIKAM0Kr5BDoWx15J12DrebMgqxr\n2qnN5E37AgMBAAECggEAGna8prfUygfsTbqSIrLjSPvHTKlXK6u+KJ8Vgoe4WL/7\nZ/tlpTw9NkBdASMJVKqhrDIiY349zg+GKYXjd0F4mZvuOGG2B1EXdK179P11v3n3\nC0Q0igfWwWYGPWelSon2S8o6MJD9jm0l3LsW5Ud8J2ZP3sycVQ64J1V0puMlRlf+\n1WiAdZyv4Yoio9jWt6fcjy1fyym93wPrm1d9GcedGRQSVc1xRo7j1cYnOApmXzZV\nSeU2f6lO0ykaKo1ytVH2zOH4/jUOVhkgC3BjwrtslWM2ecaVsIbhaBwHa/fYR1xr\nJXLkkXZHEpPQ6bATdgxqTjeRkly0Ssn3gGImGxtUjQKBgQDvlpLX8xhr39dQZ9TV\n3TAU5YN+jQbXiyiujK/SGAcOXq1Q5VYU9iya+pmIeTTXaWgiWEVtYEqGYX1lKKZs\n82MiJqZPRgbHaO9DZehQa/3XpEnaw5GqlZUksgU18N0wjJ6lwBbGuKNoi8jOwMDH\nLNZOqMGv0LR5kw0QwNYCBy9wxQKBgQDpAmrs+xUsUCVrn0CaRKxwhdrqInUcLKju\n7w9W5yUqzKEj7dcwFihRabuYwAkRzl7ejQGRB/0EH6pXl9K/c+c6P5HyNwgHTqB8\nxPHFAhXlz5t0rbk2B71mLvn46+YYQjrJMIUmSLXACoAsyYywizEbRf8OzvmIy0fh\nYz0OI08vvwKBgQCVPy4gWe23nUvqaZPa2ZuPGN4N4loFwUlJWphX/uG+YNoET6iN\nDEEDFeK4chCps57L7kLpfJdQGMDdWDI8Im15o6vsLAojBEovqPbLyknpoAzluvgt\n1FqA7mhyjqWrDZ3yULOffPtGL/WaXdZ4/IRPoa5uEEushB8adZWa09EIpQKBgQC8\nntRn2ikdohNot5XYS9c7j1/TQOmEUTK/mI3WT27q4pNfPl1/86/Xl7vgvzOYUnLB\nvWuTN+A9wlRma+SSTwTTRjqi1KGPKLsJxXPhgvqu+gxhu2++qS1M1qJMOsocwSBN\nVRW0FA/s0ZNIri9RipvJ9DOwjSO69LPPZEI8e6DSiQKBgFb6qvjAAeQ8bay/DxcK\niK/CDYw27xnQOlCpCbdBqWMw/gu28ByMi+XLLaMJFt5GsANgj8oZGHN8ObnTbrlX\nCNsjj1+jHtEokHRIWwrrMEK+Nkac+q/2u4dIPhLf6YiZR+kEVwq4o316rJxWhba7\novJx+aMoFp8gQCtSO1qOsG0N\n-----END PRIVATE KEY-----\n",
      "client_email": "burzukh@burzakh-5a5a8.iam.gserviceaccount.com",
      "client_id": "117958444201852414664",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/burzukh%40burzakh-5a5a8.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
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
