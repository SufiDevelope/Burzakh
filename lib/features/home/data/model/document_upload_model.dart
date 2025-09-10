import 'dart:io';

class DocumentUploadModel {
  String userId;
  String restingPlace;
  File? deathNotificationFile;
  File? hospitalCertification;
  File? passportOrEmirateIdFront;
  File? passportOrEmirateIdBack;
  final String nameofdeceased;
  final String dateofdeath;
  final String locationofdeath;
  final String age;
  final String gender;
  File? pickPassportFile;

  DocumentUploadModel({
    required this.userId,
    required this.restingPlace,
    required this.deathNotificationFile,
    required this.hospitalCertification,
    required this.passportOrEmirateIdFront,
    required this.passportOrEmirateIdBack,
    required this.nameofdeceased,
    required this.dateofdeath,
    required this.locationofdeath,
    required this.age,
    required this.gender,
    required this.pickPassportFile,
  });
}
