class CaseDetailModel {
   int id;
   String restingPlace;
   String deathNotificationFileStatus;
   String hospitalCertificateStatus;
   String passportOrEmirateIdFrontStatus;
   String passportOrEmirateIdBackStatus;
   String caseStatus;
   String policeClearance;

  CaseDetailModel({
    required this.id,
    required this.restingPlace,
    required this.deathNotificationFileStatus,
    required this.hospitalCertificateStatus,
    required this.passportOrEmirateIdFrontStatus,
    required this.passportOrEmirateIdBackStatus,
    required this.caseStatus,
    required this.policeClearance,
  });

  factory CaseDetailModel.fromJson(Map<String, dynamic> json) {
    return CaseDetailModel(
      id: json['id'] ?? 0,
      restingPlace: json['resting_place'] ?? '',
      deathNotificationFileStatus: json['death_notification_file_status'] ?? '',
      hospitalCertificateStatus: json['hospital_certificate_status'] ?? '',
      passportOrEmirateIdFrontStatus: json['passport_or_emirate_id_front_status'] ?? '',
      passportOrEmirateIdBackStatus: json['passport_or_emirate_id_back_status'] ?? '',
      caseStatus: json['case_status'] ?? '',
      policeClearance: json['police_clearance'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resting_place': restingPlace,
      'death_notification_file_status': deathNotificationFileStatus,
      'hospital_certificate_status': hospitalCertificateStatus,
      'passport_or_emirate_id_front_status': passportOrEmirateIdFrontStatus,
      'passport_or_emirate_id_back_status': passportOrEmirateIdBackStatus,
      'case_status': caseStatus,
      'police_clearance': policeClearance,
    };
  }
}
