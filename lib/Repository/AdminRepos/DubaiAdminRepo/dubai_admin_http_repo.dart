import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class DubaiAdminHttpRepo implements DubaiAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<DubaiMuncipalityRequestModel> getDubaiRequest() async {
    final response = await _api.getGetApiResponse(AppApis.dubaiGetRequests);
    return DubaiMuncipalityRequestModel.fromJson(response);
  }
}
