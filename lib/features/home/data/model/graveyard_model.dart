import 'dart:io';

class GraveyardModel {
  String burialTiming;
  String preferrredComm;
  String lovedcitizen;
  String userId;
  String caseId;
  File policeClearance;

  GraveyardModel({
    required this.burialTiming,
    required this.caseId,
    required this.preferrredComm,
    required this.lovedcitizen,
    required this.userId,
    required this.policeClearance,
  });
}
