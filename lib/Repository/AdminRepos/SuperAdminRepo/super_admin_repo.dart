import 'package:burzakh/Model/AdminModels/SuperAdminAllCasesModel/super_admin_all_casesModel.dart';
import 'package:burzakh/Model/AdminModels/SuperAdminAllUserModel/super_admin_all_user_model.dart';

abstract class SuperAdminRepo {
  Future<SuperAdminAllUserModel> getAllUser();
  Future<dynamic> superAdminLoginUser(email);

  Future<SuperAdminAllCases> getAllCases();

  Future<dynamic> deleteCaseById(caseId);
}
