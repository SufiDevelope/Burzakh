class DubaiMuncipalityRequestModel {
  String? message;
  int? pendingCount;
  int? approvedCount;
  int? rejectedCount;
  int? todayBurials;
  int? cancelled;
  List<DubaiMuncipalityReqestData>? allRequests;
 

  DubaiMuncipalityRequestModel({
    this.message,
    this.pendingCount,
    this.approvedCount,
    this.rejectedCount,
    this.todayBurials,
    this.cancelled,
    this.allRequests,
  });

  DubaiMuncipalityRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pendingCount = json['PendingCount'];
    approvedCount = json['ApprovedCount'];
    rejectedCount = json['RejectedCount'];
    todayBurials = json['TodayBurials'];
    cancelled = json['Cancelled'];
    if (json['AllRequests'] != null) {
      allRequests = <DubaiMuncipalityReqestData>[];
      json['AllRequests'].forEach((v) {
        allRequests!.add(new DubaiMuncipalityReqestData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['PendingCount'] = this.pendingCount;
    data['ApprovedCount'] = this.approvedCount;
    data['RejectedCount'] = this.rejectedCount;
    data['TodayBurials'] = this.todayBurials;
    data['Cancelled'] = this.cancelled;
    if (this.allRequests != null) {
      data['AllRequests'] = this.allRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DubaiMuncipalityReqestData {
  int? id;
  String? burialPlace;
  String? burialTiming;
  String? preferredCemetery;
  String? userId;
  String? caseName;
  String? graveNumber;
  String? sect;
  String? religion;
  String? specialRequest;
  String? status;
  String? createdAt;
  String? updatedAt;
  DubaiUser? user;
  List<DubaiCaseDetails>? caseDetails;

  DubaiMuncipalityReqestData(
      {this.id,
      this.burialPlace,
      this.burialTiming,
      this.preferredCemetery,
      this.userId,
      this.caseName,
      this.graveNumber,
      this.sect,
      this.religion,
      this.specialRequest,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.caseDetails});

  DubaiMuncipalityReqestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    burialPlace = json['burial_place'];
    burialTiming = json['burial_timing'];
    preferredCemetery = json['preferred_cemetery'];
    userId = json['user_id'];
    caseName = json['case_name'];
    graveNumber = json['grave_number'];
    sect = json['sect'];
    religion = json['religion'];
    specialRequest = json['special_request'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new DubaiUser.fromJson(json['user']) : null;
    if (json['case_details'] != null) {
      caseDetails = <DubaiCaseDetails>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(new DubaiCaseDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['burial_place'] = this.burialPlace;
    data['burial_timing'] = this.burialTiming;
    data['preferred_cemetery'] = this.preferredCemetery;
    data['user_id'] = this.userId;
    data['case_name'] = this.caseName;
    data['grave_number'] = this.graveNumber;
    data['sect'] = this.sect;
    data['religion'] = this.religion;
    data['special_request'] = this.specialRequest;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.caseDetails != null) {
      data['case_details'] = this.caseDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DubaiUser {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? passportCopy;
  String? marsoom;
  String? uaePass;
  String? adminType;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  DubaiUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
      this.passportCopy,
      this.marsoom,
      this.uaePass,
      this.adminType,
      this.deviceToken,
      this.createdAt,
      this.updatedAt});

  DubaiUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    passportCopy = json['passport_copy'];
    marsoom = json['marsoom'];
    uaePass = json['uae_pass'];
    adminType = json['admin_type'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['passport_copy'] = this.passportCopy;
    data['marsoom'] = this.marsoom;
    data['uae_pass'] = this.uaePass;
    data['admin_type'] = this.adminType;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DubaiCaseDetails {
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
  String? createdAt;
  String? updatedAt;

  DubaiCaseDetails(
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
      this.createdAt,
      this.updatedAt});

  DubaiCaseDetails.fromJson(Map<String, dynamic> json) {
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}