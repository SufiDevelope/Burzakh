import 'package:burzakh/Model/AdminModels/AmbulanceCassesModel/ambulance_casses_model.dart';
import 'package:burzakh/Model/AdminModels/AmbulanceSchduleModel/ambulance_schdule_model.dart';

abstract class AmbulanceRepo {
  Future<AmbulanceCaseModel> getAmbulanceCasses(driverid);
  Future<AmbulanceScheduleModel> getAmbulanceTodaySchedule(driverid);
  Future<dynamic> chnageStatusAmbulance(driverid, status);
  Future<dynamic> updateCaseStatusAmbulance(status, caseid);
}