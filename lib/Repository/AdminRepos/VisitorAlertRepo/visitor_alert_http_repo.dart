import 'package:burzakh/Model/AdminModels/VisitorAlertCaseModel/visitor_alert_case_model.dart';
import 'package:burzakh/Repository/AdminRepos/VisitorAlertRepo/visitor_alert_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class VisitorAlertHttpRepo implements VisitorAlertRepo {
  final _api = NetworkApiService();
  @override
  Future<VisitorAlertCaseModel> visitorAlertCaseApi(
      prayerTime, day, cemetery) async {
    final response = await _api.getGetApiResponse(AppApis.visitorAlertCaseApi(
        prayerTime, day, cemetery == "" ? null : cemetery));
    return VisitorAlertCaseModel.fromJson(response);
  }
}
