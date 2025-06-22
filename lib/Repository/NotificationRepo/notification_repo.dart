import 'package:burzakh/Model/NotificationModel/notificationModel.dart';

abstract class NotificationRepo {
  Future<NotificationModel> getNotification(userId);
}