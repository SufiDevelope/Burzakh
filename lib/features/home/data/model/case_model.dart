class CaseModel {
  final int id;
  final String userId;
  final String restingPlace;
  final String deathNotificationFileStatus;
  final String hospitalCertificateStatus;
  final String passportOrEmirateIdFrontStatus;
  final String passportOrEmirateIdBackStatus;
  final String caseStatus;
  final int caseName;
  final DateTime createdAt;
  final String releaseForm;
  final String additional_document;
  final String send_notification_message;
  final String name_of_deceased;
  final String date_of_death;
  final String cause_of_death;
  final String location;
  final String additional_document_upload_user;
  final String police_clearance;


  CaseModel({
    required this.id,
    required this.userId,
    required this.restingPlace,
    required this.deathNotificationFileStatus,
    required this.hospitalCertificateStatus,
    required this.passportOrEmirateIdFrontStatus,
    required this.passportOrEmirateIdBackStatus,
    required this.caseStatus,
    required this.caseName,
    required this.createdAt,
    required this.releaseForm,
    required this.additional_document,
    required this.send_notification_message,
    required this.name_of_deceased,
    required this.date_of_death,
    required this.cause_of_death,
    required this.location,
    required this.additional_document_upload_user,
    required this.police_clearance,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? '',
      restingPlace: json['resting_place'] ?? '',
      deathNotificationFileStatus: json['death_notification_file_status'] ?? '',
      hospitalCertificateStatus: json['hospital_certificate_status'] ?? '',
      passportOrEmirateIdFrontStatus: json['passport_or_emirate_id_front_status'] ?? '',
      passportOrEmirateIdBackStatus: json['passport_or_emirate_id_back_status'] ?? '',
      caseStatus: json['case_status'] ?? '',
      caseName: json['case_name'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      releaseForm: json['release_form'] ?? '',
      additional_document: json['additional_document'] ?? '',
      send_notification_message: json['send_notification_message'] ?? '',
      name_of_deceased: json['name_of_deceased'] ?? '',
      date_of_death: json['date_of_death'] ?? '',
      cause_of_death: json['cause_of_death'] ?? '',
      location: json['location'] ?? '',
      additional_document_upload_user: json['additional_document_upload_user'] ?? '',
      police_clearance: json['police_clearance'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'resting_place': restingPlace,
      'death_notification_file_status': deathNotificationFileStatus,
      'hospital_certificate_status': hospitalCertificateStatus,
      'passport_or_emirate_id_front_status': passportOrEmirateIdFrontStatus,
      'passport_or_emirate_id_back_status': passportOrEmirateIdBackStatus,
      'case_status': caseStatus,
      'case_name': caseName,
      'created_at': createdAt.toIso8601String(),
      'release_form': releaseForm,
      'additional_document': additional_document,
      'send_notification_message': send_notification_message,
      'name_of_deceased': name_of_deceased,
      'date_of_death': date_of_death,
      'cause_of_death': cause_of_death,
      'location': location,
      'additional_document_upload_user': additional_document_upload_user,
      'police_clearance': police_clearance,
    };
  }
}
