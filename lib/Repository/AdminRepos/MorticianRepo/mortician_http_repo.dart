import 'package:burzakh/Model/AdminModels/MorticianCassesModel/mortician_model.dart';
import 'package:burzakh/Repository/AdminRepos/MorticianRepo/mortician_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class MorticianHttpRepo implements MorticianRepo {
  final _api = NetworkApiService();
  @override
  Future<MorticianCassesModel> getMorticianCasses(morticianId) async {
    final respone =
        await _api.getGetApiResponse(AppApis.morticianGetCasses(morticianId));
    return MorticianCassesModel.fromJson(respone);
  }

  @override
  Future changeCaseStatus(id, status) async {
    Map<String, dynamic> data = {
      "status": status,
    };
    final response = await _api.getPostApiResponse(
        AppApis.morticianChangeCaseStatus(id), data, false);
    return response["message"];
  }

  @override
  Future changeStatus(id, status) async {
    Map<String, dynamic> data = {
      "status": status,
    };
    final response = await _api.getPostApiResponse(
        AppApis.changeDutyStatusMortician(id), data, false);
    return response["message"];
  }
}
