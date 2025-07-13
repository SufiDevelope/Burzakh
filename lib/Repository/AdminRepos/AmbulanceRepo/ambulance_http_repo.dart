import 'dart:developer';

import 'package:burzakh/Model/AdminModels/AmbulanceCassesModel/ambulance_casses_model.dart';
import 'package:burzakh/Model/AdminModels/AmbulanceSchduleModel/ambulance_schdule_model.dart';
import 'package:burzakh/Repository/AdminRepos/AmbulanceRepo/ambulance_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class AmbulanceHttpRepo implements AmbulanceRepo {
  final _api = NetworkApiService();
  @override
  Future<AmbulanceCaseModel> getAmbulanceCasses(driverid) async {
    final response =
        await _api.getGetApiResponse(AppApis.ambulanceCassesList(driverid));
    return AmbulanceCaseModel.fromJson(response);
  }

  @override
  Future<AmbulanceScheduleModel> getAmbulanceTodaySchedule(driverid) async {
    final response =
        await _api.getGetApiResponse(AppApis.getTodaysSchedule(driverid));
    return AmbulanceScheduleModel.fromJson(response);
  }

  @override
  Future chnageStatusAmbulance(driverid, status) async {
    Map<String, dynamic> data = {"user_id": driverid, "status": status};
    final response =
        await _api.getPostApiResponse(AppApis.changeStatus, data, false);
    return response["message"];
  }

  @override
  Future updateCaseStatusAmbulance(status, caseid) async {
    log(caseid);
    Map<String, dynamic> data = {"status": status};
    final response = await _api.getPostApiResponse(
        AppApis.updateCaseStatus(caseid), data, false);
    return response["message"];
  }
}
