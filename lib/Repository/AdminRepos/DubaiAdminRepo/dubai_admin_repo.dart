import 'package:burzakh/Model/AdminModels/AmbulancesModel/ambulancesModel.dart';
import 'package:burzakh/Model/AdminModels/DubaiChatModel/dubai_chat_model.dart';
import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/features/emirati_svcs/data/model/GetCaseNameModel.dart';

abstract class DubaiAdminRepo {
  Future<DubaiMuncipalityRequestModel> getDubaiRequest();
  Future<dynamic> sendSupportMessage(userId, message);
  Future<DubaiChatModel> getSupportMessage(userid);
  Future<AmbulancesModel> getAmbulances();
  Future<dynamic> assignGraveApi(caseId, action, graveNo);
  Future<CaseNameModel> getCaseName(userid);
  // For User Side
  Future<dynamic> submitCaseToMuncipality(burial_place, user_id, case_name,
      burial_timing, sect, religion, special_request, preferred_cemetery);
  
  // Dispatch Ambulance
  Future<dynamic> dispatchAmbulance(userId, case_name, vehicle_number, mosque_name);
}
