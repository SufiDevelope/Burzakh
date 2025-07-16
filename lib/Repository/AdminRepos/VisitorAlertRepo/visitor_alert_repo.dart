import 'package:burzakh/Model/AdminModels/VisitorAlertCaseModel/visitor_alert_case_model.dart';

abstract class VisitorAlertRepo {
  Future<VisitorAlertCaseModel> visitorAlertCaseApi(prayerTime, day, cemetery);
}
