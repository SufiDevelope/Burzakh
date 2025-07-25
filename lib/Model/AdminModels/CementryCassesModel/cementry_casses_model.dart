class CementryCassesModel {
  String? message;
  int? pendingCount;
  int? approvedCount;
  int? todayBurials;
  int? totalCases;
  int? activeMorticians;
  List<CementryCassesData>? cases;

  CementryCassesModel(
      {this.message,
      this.pendingCount,
      this.approvedCount,
      this.todayBurials,
      this.totalCases,
      this.activeMorticians,
      this.cases});

  CementryCassesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pendingCount = json['PendingCount'];
    approvedCount = json['ApprovedCount'];
    todayBurials = json['TodayBurials'];
    totalCases = json['TotalCases'];
    activeMorticians = json['ActiveMorticians'];
    if (json['cases'] != null) {
      cases = <CementryCassesData>[];
      json['cases'].forEach((v) {
        cases!.add(new CementryCassesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['PendingCount'] = this.pendingCount;
    data['ApprovedCount'] = this.approvedCount;
    data['TodayBurials'] = this.todayBurials;
    data['TotalCases'] = this.totalCases;
    data['ActiveMorticians'] = this.activeMorticians;
    if (this.cases != null) {
      data['cases'] = this.cases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CementryCassesData {
  int? id;
  String? caseName;
  String? userId;
  String? graveNumber;
  String? morticianId;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<CaseDetails>? caseDetails;
  Mortician? mortician;
  MuncipalityRecord? muncipalityRecord;

  CementryCassesData(
      {this.id,
      this.caseName,
      this.userId,
      this.graveNumber,
      this.morticianId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.caseDetails});

  CementryCassesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseName = json['case_name'];
    userId = json['user_id'];
    graveNumber = json['grave_number'];
    morticianId = json['mortician_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['case_details'] != null) {
      caseDetails = <CaseDetails>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(new CaseDetails.fromJson(v));
      });
    }
    mortician = json['mortician'] != null
        ? new Mortician.fromJson(json['mortician'])
        : null;
    muncipalityRecord = json['mancipality_record'] != null
        ? MuncipalityRecord.fromJson(json['mancipality_record'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_name'] = this.caseName;
    data['user_id'] = this.userId;
    data['grave_number'] = this.graveNumber;
    data['mortician_id'] = this.morticianId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.caseDetails != null) {
      data['case_details'] = this.caseDetails!.map((v) => v.toJson()).toList();
    }
    if (this.mortician != null) {
      data['mortician'] = this.mortician!.toJson();
    }
    if (this.muncipalityRecord != null) {
      data['mancipality_record'] = this.muncipalityRecord!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class CaseDetails {
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
  int? adminId;
  String? nameOfDeceased;
  String? dateOfDeath;
  String? causeOfDeath;
  String? location;
  String? additionalDocumentUploadUser;
  String? burialSubmissionStatus;
  String? createdAt;
  String? updatedAt;

  CaseDetails(
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

  CaseDetails.fromJson(Map<String, dynamic> json) {
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

class Mortician {
  int? id;
  String? name;
  String? caseName;
  String? userId;
  String? phoneNumber;
  String? status;
  String? createdAt;
  String? updatedAt;

  Mortician({
    this.id,
    this.name,
    this.caseName,
    this.userId,
    this.phoneNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Mortician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caseName = json['case_name'];
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['case_name'] = caseName;
    data['user_id'] = userId;
    data['phone_number'] = phoneNumber;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MuncipalityRecord {
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

  MuncipalityRecord({
    this.id,
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
  });

  MuncipalityRecord.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    return data;
  }
}
