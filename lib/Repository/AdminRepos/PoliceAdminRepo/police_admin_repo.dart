import 'dart:io';

import 'package:burzakh/Model/AdminModels/CasesCountModel/cases_count_model.dart';
import 'package:burzakh/Model/AdminModels/FilterCassesModel/filter_casses_model.dart';

abstract class PoliceAdminRepo {
  Future<CassesCountModel> getCassesCount();
  Future<FilterCassesModel> getFilteredCases(String filter);
  Future<dynamic> getVideoCallSchedule(
      userId, date, time, admin_id, meeting_id);
  Future<dynamic> policeQuickActionApi(
    adminId,
    userId,
    caseId,
    File? releasedForm,
    String? sendNotificationMessage,
    String? additionalDocument,
  );

  Future<dynamic> approvePoliceCaseApi(caseId, userId, File clearanceForm);
  Future<dynamic> uploadAdditionalDocument(caseId, userid, File additionalDocument);


}
