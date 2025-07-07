import 'package:burzakh/Model/NotificationModel/muncipality_notification_model.dart';
import 'package:burzakh/Model/NotificationModel/notificationModel.dart';

abstract class NotificationRepo {
  Future<NotificationModel> getNotification(userId);
  Future<MuncipalityNotifs> getMuncipalityNotification();
}