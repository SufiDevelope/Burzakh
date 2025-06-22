import 'dart:developer';
import 'dart:io';
import 'package:burzakh/Model/AdminModels/CasesCountModel/cases_count_model.dart';
import 'package:burzakh/Model/AdminModels/FilterCassesModel/filter_casses_model.dart';
import 'package:burzakh/Repository/AdminRepos/PoliceAdminRepo/police_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class PoliceAdminHttpRepo implements PoliceAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<CassesCountModel> getCassesCount() async {
    final response = await _api.getGetApiResponse(AppApis.policeCassesCountApi);
    return CassesCountModel.fromJson(response);
  }

  @override
  Future<FilterCassesModel> getFilteredCases(String? filter) async {
    log(AppApis.policeFilterCassesApi(filter));
    final response =
        await _api.getGetApiResponse(AppApis.policeFilterCassesApi(filter));
    return FilterCassesModel.fromJson(response);
  }

  @override
  Future<dynamic> getVideoCallSchedule(
      userId, date, time, admin_id, meeting_id) async {
    Map<String, dynamic> data = {
      "user_id": userId,
      "date": date,
      "time": time,
      "admin_id": admin_id,
      "meeting_id": meeting_id,
    };

    log(data.toString());

    final response = await _api.getPostApiResponse(
        AppApis.policeVideoCallScheduleApi, data, false);
    log(response.toString());
    return response;
  }

  @override
  Future<dynamic> policeQuickActionApi(
    dynamic adminId,
    dynamic userId,
    dynamic caseId,
    File? releasedForm,
    String? sendNotificationMessage,
    String? additionalDocument,
  ) async {
    log("In");

    final Map<String, dynamic> data = {
      "admin_id": adminId,
      "user_id": userId,
      "case_id": caseId,
      "send_notification_message": sendNotificationMessage,
      "additional_document": additionalDocument,
    };

    // Only add release_form if file is provided and path is not empty
    bool hasFile = releasedForm != null && releasedForm.path.isNotEmpty;
    if (hasFile) {
      data["release_form"] = releasedForm;
    }

    log("Out");
    log(data.toString());

    final response = await _api.getPostApiResponse(
      AppApis.policeQuickActionApi,
      data,
      hasFile,
    );

    log(response.toString());
    return response["message"];
  }

  @override
  Future approvePoliceCaseApi(caseId, userId, File clearanceForm) async {
    Map<String, dynamic> data = {
      "police_clearance_certificate": clearanceForm,
    };

    final response = await _api.getPostApiResponse(
        AppApis.approvePoliceCaseApi(caseId, userId), data, true);
    return response;
  }

  @override
  Future uploadAdditionalDocument(
      caseId, userid, File additionalDocument) async {
    Map<String, dynamic> data = {
      "additional_document_upload_user": additionalDocument,
      "user_id": userid,
    };

    final response = await _api.getPostApiResponse(
        AppApis.uploadAdditionalDoc(caseId), data, true);
    return response["message"];
  }
}
