import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/chat/Controller/AppStateController/app_state_controller.dart';
import 'package:burzakh/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app/multi_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppStateController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(await provider());
}
