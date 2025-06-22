import 'package:burzakh/Model/NotificationModel/notificationModel.dart';
import 'package:burzakh/Repository/NotificationRepo/notification_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class NotificationHttpRepo implements NotificationRepo {
  final _api = NetworkApiService();

  @override
  Future<NotificationModel> getNotification(userId) async {
    final response =
        await _api.getGetApiResponse(AppApis.notificationsApi(userId));
    return NotificationModel.fromJson(response);
  }
}
