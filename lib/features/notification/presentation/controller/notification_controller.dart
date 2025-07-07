import 'dart:developer';

import 'package:burzakh/Model/NotificationModel/muncipality_notification_model.dart';
import 'package:burzakh/Model/NotificationModel/notificationModel.dart';
import 'package:burzakh/Repository/NotificationRepo/notification_http_repo.dart';
import 'package:burzakh/Repository/NotificationRepo/notification_repo.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:get/get.dart';

import '../../../../data/Response/status.dart';

class NotificationController extends GetxController {
  var model = NotificationModel().obs;
  final rxRequestStatusForAllCassesCount = Status.loading.obs;
  final NotificationRepo repo = NotificationHttpRepo();

  // Get the Contact List From Api
  void setRxRequestStatusForGetNotifs(Status value) =>
      rxRequestStatusForAllCassesCount.value = value;
  void setGetNotifs(NotificationModel data) {
    model.value = data;
  }

  void getNotifs() async {
    try {
      UserShareprefController pref = UserShareprefController();
      UserModel? userModel = await pref.getData();
      log(userModel?.id.toString() ?? '');
      setRxRequestStatusForGetNotifs(Status.loading);
      repo.getNotification(userModel?.id ?? 0).then((value) {
        setRxRequestStatusForGetNotifs(Status.completed);
        setGetNotifs(value);
      }).onError((error, stackTrace) {
        setRxRequestStatusForGetNotifs(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForGetNotifs(Status.error);
    }
  }

  var modelNotifs = MuncipalityNotifs().obs;
  final rxRequestForAllNotifs = Status.loading.obs;

  void setRxRequestForAllNotifs(Status value) =>
      rxRequestForAllNotifs.value = value;
  void setAllNotifs(MuncipalityNotifs data) {
    modelNotifs.value = data;
  }

  void getAllNotifs() async {
    try {
      setRxRequestForAllNotifs(Status.loading);
      repo.getMuncipalityNotification().then((value) {
        setRxRequestForAllNotifs(Status.completed);
        setAllNotifs(value);
      }).onError((error, stackTrace) {
        setRxRequestForAllNotifs(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestForAllNotifs(Status.error);
    }
  }
}
