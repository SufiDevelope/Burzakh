import 'package:burzakh/Model/AdminModels/AmbulancesModel/ambulancesModel.dart';
import 'package:burzakh/Model/AdminModels/DubaiChatModel/dubai_chat_model.dart';
import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';
import 'package:burzakh/features/emirati_svcs/data/model/GetCaseNameModel.dart';

class DubaiAdminHttpRepo implements DubaiAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<DubaiMuncipalityRequestModel> getDubaiRequest() async {
    final response = await _api.getGetApiResponse(AppApis.dubaiGetRequests);
    return DubaiMuncipalityRequestModel.fromJson(response);
  }

  @override
  Future sendSupportMessage(userId, message) async {
    Map<String, dynamic> data = {
      "user_id": userId,
      "message": message,
    };
    final response =
        await _api.getPostApiResponse(AppApis.dubaiSendMessage, data, false);
    return response["message"];
  }

  @override
  Future<DubaiChatModel> getSupportMessage(userid) async {
    final response =
        await _api.getGetApiResponse(AppApis.getDubaiSupportMessage(userid));
    return DubaiChatModel.fromJson(response);
  }

  @override
  Future<AmbulancesModel> getAmbulances() async {
    final response = await _api.getGetApiResponse(AppApis.getAmbulance);
    return AmbulancesModel.fromJson(response);
  }

  @override
  Future assignGraveApi(caseId, action, graveNo) async {
    Map<String, dynamic> data = {
      "action": action,
      "grave_number": graveNo,
    };
    final response = await _api.getPostApiResponse(
        AppApis.dubaiGraveAssign(caseId), data, false);
    return response["message"];
  }

  @override
  Future<CaseNameModel> getCaseName(userid) async {
    final response = await _api
        .getGetApiResponse("${AppApis.baseUrl}${AppApis.getCaseName}/$userid");
    return CaseNameModel.fromJson(response);
  }

  @override
  Future submitCaseToMuncipality(
      burial_place,
      user_id,
      case_name,
      burial_timing,
      sect,
      religion,
      special_request,
      preferred_cemetery) async {
    Map<String, dynamic> data = {
      "burial_place": burial_place,
      "user_id": user_id,
      "case_name": case_name,
      "burial_timing": burial_timing,
      "sect": sect,
      "religion": religion,
      "special_request": special_request,
      "preferred_cemetery": preferred_cemetery,
    };
    final response = await _api.getPostApiResponse(
        AppApis.dubaiSubmitMunicipality, data, false);
    return response["message"];
  }

  @override
  Future dispatchAmbulance(userId, case_name, vehicle_number, standby_mosque) async {
    Map<String, dynamic> data = {
      "case_name": case_name,
      "user_id": userId,
      "vehicle_number": vehicle_number,
      "standby_mosque": standby_mosque,
    };
    final response =
        await _api.getPostApiResponse(AppApis.dispatchAmbulance, data, false);
    return response["message"];
  }
}
