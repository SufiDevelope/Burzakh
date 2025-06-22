import 'package:burzakh/Model/AdminModels/FilterRtaRequestModel/filter_rta_requestModel.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestDetailsModel/rta_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestModel/rta_request_model.dart';

abstract class RtaAdminRepo {
  Future<RtaRequestModel> getRtaRequest();
  Future<RtaRequestDetailsModel> getRtaRequestDetails(id);
  Future<dynamic> updateRtaRequestStatus(id, status);
  Future<FilterRtaRequestModel> filterRtaRequest(filter);
  Future<RtaChatModel> getRtaChat(id);
  Future<dynamic> sendRtaChatMessage(id, message);
  Future<dynamic> sendUserChatMessage(id, admin_type, message);
}
