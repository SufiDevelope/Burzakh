import 'package:burzakh/Model/AdminModels/CdaFilterRequestApi/cda_filter_request_api.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestDetailsModel/cda_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestModel/cda_request_model.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';

abstract class CdaAdminRepo {
  Future<CdaRequestModel> getCdaRequest();
  Future<CdaFilterRequestModel> getCdaFilterRequest(filter);
  Future<CdaRequestDetailsModel> getCdaRequestDetails(id);
  Future<dynamic> updateCdaRequestStatus(id, status, String? rejectionReason);
  Future<RtaChatModel> getCdaChat(id);
  Future<dynamic> sendCdaChatMessage(id, message);
}
