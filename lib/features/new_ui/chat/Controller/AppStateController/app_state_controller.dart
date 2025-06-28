import 'package:get/get.dart';

class AppStateController extends GetxController {
  var isAppInForeground = true.obs;

  void updateAppState(bool isForeground) {
    isAppInForeground.value = isForeground;
  }
}
