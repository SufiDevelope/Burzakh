import 'dart:developer';

import 'package:burzakh/Model/AdminModels/FilterRtaRequestModel/filter_rta_requestModel.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestDetailsModel/rta_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestModel/rta_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/RtaAdminRepo/rta_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class RtaAdminHttpRepo implements RtaAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<RtaRequestModel> getRtaRequest() async {
    final response = await _api.getGetApiResponse(AppApis.rtarequestApi);
    return RtaRequestModel.fromJson(response);
  }

  @override
  Future<RtaRequestDetailsModel> getRtaRequestDetails(id) async {
    final response =
        await _api.getGetApiResponse(AppApis.rtarequestDetailApi(id));
    return RtaRequestDetailsModel.fromJson(response);
  }

  @override
  Future updateRtaRequestStatus(id, status, String? rejectionReason) async {
    Map<String, dynamic> data = {"action": status};

    if (rejectionReason != null) {
      data["rejection_reason"] = rejectionReason;
    }
    final response = await _api.getPostApiResponse(
        AppApis.updateRtaRequestStatus(id), data, false);
    return response["message"];
  }

  @override
  Future<FilterRtaRequestModel> filterRtaRequest(filter) async {
    final response = await _api.getGetApiResponse(AppApis.rtaFilterApi(filter));
    return FilterRtaRequestModel.fromJson(response);
  }

  @override
  Future<RtaChatModel> getRtaChat(id) async {
    final response = await _api.getGetApiResponse(AppApis.getRtaChatApi(id));
    return RtaChatModel.fromJson(response);
  }

  @override
  Future sendRtaChatMessage(id, message) async {
    final response = await _api.getPostApiResponse(
        AppApis.sendrtaChatApi(id, message), {}, false);
    return response["message"];
  }

  @override
  Future sendUserChatMessage(id, admin_type, message) async {
    Map<String, dynamic> data = {
      "user_id": id,
      "admin_type": admin_type,
      "message": message
    };

    log(data.toString());
    final response = await _api.getPostApiResponse(
        AppApis.sendUserChatMessageApi, data, false);
    return response["message"];
  }
}
