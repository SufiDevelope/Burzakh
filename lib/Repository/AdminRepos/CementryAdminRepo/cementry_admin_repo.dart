import 'package:burzakh/Model/AdminModels/CementryCassesModel/cementry_casses_model.dart';
import 'package:burzakh/Model/AdminModels/GetActiveMorticianModel/get_active_mortician_model.dart';
import 'package:burzakh/Model/AdminModels/MorticianModel/mortician_model.dart';

abstract class CementryAdminRepo {
  Future<CementryCassesModel> getCementryCasses();
  Future<GetActiveMorticiansModel> getActiveMorticians();
  Future<dynamic> activeMorticiansApi(caseId, morticianId, caseName);
  Future<dynamic> createVisitorAlertApi(name, gender, alert_time, cemetery_location, mosque_name, description, description_arabic, status, make_as_important);
  Future<dynamic> removeMorticianApi(morticianId);
  Future<MorticianModel> getAllMorticians();
}
