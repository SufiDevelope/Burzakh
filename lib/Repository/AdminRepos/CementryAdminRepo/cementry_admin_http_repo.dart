import 'package:burzakh/Model/AdminModels/CementryCassesModel/cementry_casses_model.dart';
import 'package:burzakh/Model/AdminModels/GetActiveMorticianModel/get_active_mortician_model.dart';
import 'package:burzakh/Model/AdminModels/MorticianModel/mortician_model.dart';
import 'package:burzakh/Repository/AdminRepos/CementryAdminRepo/cementry_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class CementryAdminHttpRepo implements CementryAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<CementryCassesModel> getCementryCasses() async {
    final response = await _api.getGetApiResponse(AppApis.cemnetryCassesApi);
    return CementryCassesModel.fromJson(response);
  }

  @override
  Future<GetActiveMorticiansModel> getActiveMorticians() async {
    final response = await _api.getGetApiResponse(AppApis.getActiveMorticians);
    return GetActiveMorticiansModel.fromJson(response);
  }

  @override
  Future activeMorticiansApi(caseId, morticianId, caseName) async {
    Map<String, dynamic> data = {
      "mortician_id": morticianId,
      "case_name": caseName,
    };
    final response = await _api.getPostApiResponse(
        AppApis.assignMortician(caseId), data, false);
    return response["message"];
  }

  @override
  Future createVisitorAlertApi(
      name,
      gender,
      alert_time,
      cemetery_location,
      mosque_name,
      description,
      description_arabic,
      status,
      make_as_important) async {
    Map<String, dynamic> data = {
      "name": name,
      "gender": gender,
      "alert_time": alert_time,
      "cemetery_location": cemetery_location,
      "mosque_name": mosque_name,
      "description": description,
      "description_arabic": description_arabic,
      "status": status,
      "make_as_important": make_as_important,
    };
    final response =
        await _api.getPostApiResponse(AppApis.createVisitorAlert, data, false);
    return response["message"];
  }

  @override
  Future removeMorticianApi(morticianId) async {
    final response = await _api.getPostApiResponse(
        AppApis.removeMortician(morticianId), {}, false);
    return response["message"];
  }

  @override
  Future<MorticianModel> getAllMorticians() async {
    final response = await _api.getGetApiResponse(AppApis.getAllMorticians);
    return MorticianModel.fromJson(response);
  }
}
