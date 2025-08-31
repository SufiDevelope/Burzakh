import 'dart:developer';

import 'package:burzakh/Model/AdminModels/SuperAdminAllCasesModel/super_admin_all_casesModel.dart';
import 'package:burzakh/Model/AdminModels/SuperAdminAllUserModel/super_admin_all_user_model.dart';
import 'package:burzakh/Repository/AdminRepos/SuperAdminRepo/super_admin_repo.dart';
import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/data/Network/network_api_service.dart';

class SuperAdminHttpRepo implements SuperAdminRepo {
  final _api = NetworkApiService();
  @override
  Future<SuperAdminAllUserModel> getAllUser() async {
    final response =
        await _api.getPostApiResponse(AppApis.superAdminAllUserApi, {}, false);
    return SuperAdminAllUserModel.fromJson(response);
  }

  @override
  Future superAdminLoginUser(email) async {
    Map<String, dynamic> data = {"email_or_phone": email};
    final response = await _api.getPostApiResponse(
        AppApis.superAdminLoginUserApi, data, false);
    log(response['user']['admin_type'].toString());
    return response;
  }

  @override
  Future<SuperAdminAllCases> getAllCases() async {
    final response =
        await _api.getGetApiResponse(AppApis.superAdminAllCasesApi);
    return SuperAdminAllCases.fromJson(response);
  }

  @override
  Future deleteCaseById(caseId) async {
    final response = await _api
        .getdeleteApiResponse(AppApis.superAdminCasesDeleteApi(caseId));
    return response;
  }
}
