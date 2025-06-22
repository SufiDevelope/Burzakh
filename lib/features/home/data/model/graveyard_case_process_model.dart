class GraveyardCaseProcessModel {
  String deathNotificationFileStatus;
  String hospitalCertificateStatus;
  String passportOrEmirateIdFrontStatus;
  String policeApprovel;

  GraveyardCaseProcessModel({
    required this.deathNotificationFileStatus,
    required this.hospitalCertificateStatus,
    required this.passportOrEmirateIdFrontStatus,
    required this.policeApprovel,
  });

  factory GraveyardCaseProcessModel.fromJson(Map<String, dynamic> json) {
    return GraveyardCaseProcessModel(
      deathNotificationFileStatus: json['death_notification_status'] ?? '',
      hospitalCertificateStatus: json['hospital_certificate_status'] ?? '',
      passportOrEmirateIdFrontStatus: json['passport_status'] ?? '',
      policeApprovel: json['police_clearence_certificate_status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'death_notification_status': deathNotificationFileStatus,
      'hospital_certificate_status': hospitalCertificateStatus,
      'passport_status': passportOrEmirateIdFrontStatus,
      'police_clearence_certificate_status': policeApprovel
    };
  }
}
