import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';

abstract class DubaiAdminRepo {
  Future<DubaiMuncipalityRequestModel> getDubaiRequest();
}
