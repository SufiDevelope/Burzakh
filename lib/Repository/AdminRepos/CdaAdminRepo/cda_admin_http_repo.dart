import 'package:burzakh/Model/AdminModels/CdaFilterRequestApi/cda_filter_request_api.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestDetailsModel/cda_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestModel/cda_request_model.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';
import 'package:burzakh/Repository/AdminRepos/CdaAdminRepo/cda_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class CdaAdminHttpRepo implements CdaAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<CdaRequestModel> getCdaRequest() async {
    final response = await _api.getGetApiResponse(AppApis.cdaRequestApi);
    return CdaRequestModel.fromJson(response);
  }

  @override
  Future<CdaFilterRequestModel> getCdaFilterRequest(filter) async {
    final response = await _api.getGetApiResponse(AppApis.cdaFilterApi(filter));
    return CdaFilterRequestModel.fromJson(response);
  }

  @override
  Future<CdaRequestDetailsModel> getCdaRequestDetails(id) async {
    final response =
        await _api.getGetApiResponse(AppApis.cdaRequestDetailApi(id));
    return CdaRequestDetailsModel.fromJson(response);
  }

  @override
  Future updateCdaRequestStatus(id, status, String? rejectionReason) async {
    Map<String, dynamic> data = {"action": status};
    if (rejectionReason != null) {
      data["rejection_reason"] = rejectionReason;
    }
    final response = await _api.getPostApiResponse(
        AppApis.updateCdaRequestStatus(id), data, false);
    return response["message"];
  }

  @override
  Future<RtaChatModel> getCdaChat(id) async {
    final response = await _api.getGetApiResponse(AppApis.getCdaChatApi(id));
    return RtaChatModel.fromJson(response);
  }

  @override
  Future sendCdaChatMessage(id, message) async {
    final response = await _api.getPostApiResponse(
        AppApis.sendCdaChatApi(id, message), {}, false);
    return response["message"];
  }
}
