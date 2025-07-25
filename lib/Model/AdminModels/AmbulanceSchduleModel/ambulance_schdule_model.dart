class AmbulanceScheduleModel {
  bool? success;
  String? message;
  List<DispatchedCasesList>? dispatchedCases;
  List<CaseDetailsList>? caseDetails;

  AmbulanceScheduleModel(
      {this.success, this.message, this.dispatchedCases, this.caseDetails});

  AmbulanceScheduleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['dispatched_cases'] != null) {
      dispatchedCases = <DispatchedCasesList>[];
      json['dispatched_cases'].forEach((v) {
        dispatchedCases!.add(new DispatchedCasesList.fromJson(v));
      });
    }
    if (json['case_details'] != null) {
      caseDetails = <CaseDetailsList>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(new CaseDetailsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dispatchedCases != null) {
      data['dispatched_cases'] =
          this.dispatchedCases!.map((v) => v.toJson()).toList();
    }
    if (this.caseDetails != null) {
      data['case_details'] = this.caseDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DispatchedCasesList {
  int? id;
  String? caseName;
  String? standbyMosque;
  String? additionalNotes;
  dynamic userId;
  String? vehicleNumber;
  String? status;
  String? createdAt;
  String? updatedAt;

  DispatchedCasesList(
      {this.id,
      this.caseName,
      this.standbyMosque,
      this.additionalNotes,
      this.userId,
      this.vehicleNumber,
      this.status,
      this.createdAt,
      this.updatedAt});

  DispatchedCasesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseName = json['case_name'];
    standbyMosque = json['standby_mosque'];
    additionalNotes = json['additional_notes'];
    userId = json['user_id'];
    vehicleNumber = json['vehicle_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_name'] = this.caseName;
    data['standby_mosque'] = this.standbyMosque;
    data['additional_notes'] = this.additionalNotes;
    data['user_id'] = this.userId;
    data['vehicle_number'] = this.vehicleNumber;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CaseDetailsList {
  int? id;
  String? userId;
  String? restingPlace;
  String? policeClearance;
  String? deathNotificationFile;
  String? deathNotificationFileStatus;
  String? hospitalCertificate;
  String? hospitalCertificateStatus;
  String? passportOrEmirateIdFront;
  String? passportOrEmirateIdFrontStatus;
  String? passportOrEmirateIdBack;
  String? passportOrEmirateIdBackStatus;
  String? caseStatus;
  String? releaseForm;
  String? additionalDocument;
  String? sendNotificationMessage;
  String? adminId;
  String? nameOfDeceased;
  String? dateOfDeath;
  String? causeOfDeath;
  String? location;
  String? additionalDocumentUploadUser;
  String? burialSubmissionStatus;
  String? createdAt;
  String? updatedAt;

  CaseDetailsList(
      {this.id,
      this.userId,
      this.restingPlace,
      this.policeClearance,
      this.deathNotificationFile,
      this.deathNotificationFileStatus,
      this.hospitalCertificate,
      this.hospitalCertificateStatus,
      this.passportOrEmirateIdFront,
      this.passportOrEmirateIdFrontStatus,
      this.passportOrEmirateIdBack,
      this.passportOrEmirateIdBackStatus,
      this.caseStatus,
      this.releaseForm,
      this.additionalDocument,
      this.sendNotificationMessage,
      this.adminId,
      this.nameOfDeceased,
      this.dateOfDeath,
      this.causeOfDeath,
      this.location,
      this.additionalDocumentUploadUser,
      this.burialSubmissionStatus,
      this.createdAt,
      this.updatedAt});

  CaseDetailsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restingPlace = json['resting_place'];
    policeClearance = json['police_clearance'];
    deathNotificationFile = json['death_notification_file'];
    deathNotificationFileStatus = json['death_notification_file_status'];
    hospitalCertificate = json['hospital_certificate'];
    hospitalCertificateStatus = json['hospital_certificate_status'];
    passportOrEmirateIdFront = json['passport_or_emirate_id_front'];
    passportOrEmirateIdFrontStatus =
        json['passport_or_emirate_id_front_status'];
    passportOrEmirateIdBack = json['passport_or_emirate_id_back'];
    passportOrEmirateIdBackStatus = json['passport_or_emirate_id_back_status'];
    caseStatus = json['case_status'];
    releaseForm = json['release_form'];
    additionalDocument = json['additional_document'];
    sendNotificationMessage = json['send_notification_message'];
    adminId = json['admin_id'];
    nameOfDeceased = json['name_of_deceased'];
    dateOfDeath = json['date_of_death'];
    causeOfDeath = json['cause_of_death'];
    location = json['location'];
    additionalDocumentUploadUser = json['additional_document_upload_user'];
    burialSubmissionStatus = json['burial_submission_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['resting_place'] = this.restingPlace;
    data['police_clearance'] = this.policeClearance;
    data['death_notification_file'] = this.deathNotificationFile;
    data['death_notification_file_status'] = this.deathNotificationFileStatus;
    data['hospital_certificate'] = this.hospitalCertificate;
    data['hospital_certificate_status'] = this.hospitalCertificateStatus;
    data['passport_or_emirate_id_front'] = this.passportOrEmirateIdFront;
    data['passport_or_emirate_id_front_status'] =
        this.passportOrEmirateIdFrontStatus;
    data['passport_or_emirate_id_back'] = this.passportOrEmirateIdBack;
    data['passport_or_emirate_id_back_status'] =
        this.passportOrEmirateIdBackStatus;
    data['case_status'] = this.caseStatus;
    data['release_form'] = this.releaseForm;
    data['additional_document'] = this.additionalDocument;
    data['send_notification_message'] = this.sendNotificationMessage;
    data['admin_id'] = this.adminId;
    data['name_of_deceased'] = this.nameOfDeceased;
    data['date_of_death'] = this.dateOfDeath;
    data['cause_of_death'] = this.causeOfDeath;
    data['location'] = this.location;
    data['additional_document_upload_user'] = this.additionalDocumentUploadUser;
    data['burial_submission_status'] = this.burialSubmissionStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
