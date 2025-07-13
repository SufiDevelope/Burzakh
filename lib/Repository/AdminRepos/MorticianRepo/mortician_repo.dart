import 'package:burzakh/Model/AdminModels/MorticianCassesModel/mortician_model.dart';

abstract class MorticianRepo {
  Future<MorticianCassesModel> getMorticianCasses(morticianId);
  Future<dynamic> changeCaseStatus(id, status);
  Future<dynamic> changeStatus(id, status);
}