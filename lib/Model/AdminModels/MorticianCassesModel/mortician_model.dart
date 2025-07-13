class MorticianCassesModel {
  CaseCounts? caseCounts;
  MorticianCassesData? mortician;

  MorticianCassesModel({this.caseCounts, this.mortician});

  MorticianCassesModel.fromJson(Map<String, dynamic> json) {
    caseCounts = json['case_counts'] != null
        ? new CaseCounts.fromJson(json['case_counts'])
        : null;
    mortician = json['mortician'] != null
        ? new MorticianCassesData.fromJson(json['mortician'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.caseCounts != null) {
      data['case_counts'] = this.caseCounts!.toJson();
    }
    if (this.mortician != null) {
      data['mortician'] = this.mortician!.toJson();
    }
    return data;
  }
}

class CaseCounts {
  int? pending;
  int? assigned;
  int? ghuslInProgress;
  int? completed;

  CaseCounts(
      {this.pending, this.assigned, this.ghuslInProgress, this.completed});

  CaseCounts.fromJson(Map<String, dynamic> json) {
    pending = json['Pending'];
    assigned = json['Assigned'];
    ghuslInProgress = json['Ghusl-in-Progress'];
    completed = json['Completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pending'] = this.pending;
    data['Assigned'] = this.assigned;
    data['Ghusl-in-Progress'] = this.ghuslInProgress;
    data['Completed'] = this.completed;
    return data;
  }
}

class MorticianCassesData {
  int? id;
  String? name;
  String? caseName;
  String? userId;
  String? phoneNumber;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<CemeteryCases>? cemeteryCases;

  MorticianCassesData(
      {this.id,
      this.name,
      this.caseName,
      this.userId,
      this.phoneNumber,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cemeteryCases});

  MorticianCassesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caseName = json['case_name'];
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cemetery_cases'] != null) {
      cemeteryCases = <CemeteryCases>[];
      json['cemetery_cases'].forEach((v) {
        cemeteryCases!.add(new CemeteryCases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['case_name'] = this.caseName;
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cemeteryCases != null) {
      data['cemetery_cases'] =
          this.cemeteryCases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CemeteryCases {
  int? id;
  String? caseName;
  String? userId;
  String? graveNumber;
  String? morticianId;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<CaseDetails>? caseDetails;
  MancipalityRecord? mancipalityRecord;

  CemeteryCases(
      {this.id,
      this.caseName,
      this.userId,
      this.graveNumber,
      this.morticianId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.caseDetails,
      this.mancipalityRecord});

  CemeteryCases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseName = json['case_name'];
    userId = json['user_id'];
    graveNumber = json['grave_number'];
    morticianId = json['mortician_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['case_details'] != null) {
      caseDetails = <CaseDetails>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(new CaseDetails.fromJson(v));
      });
    }
    mancipalityRecord = json['mancipality_record'] != null
        ? new MancipalityRecord.fromJson(json['mancipality_record'])
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
    if (this.caseDetails != null) {
      data['case_details'] = this.caseDetails!.map((v) => v.toJson()).toList();
    }
    if (this.mancipalityRecord != null) {
      data['mancipality_record'] = this.mancipalityRecord!.toJson();
    }
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
  String? adminId;
  String? nameOfDeceased;
  String? dateOfDeath;
  String? causeOfDeath;
  String? location;
  String? additionalDocumentUploadUser;
  String? burialSubmissionStatus;
  String? ratio;
  String? ambulanceDispatched;
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
      this.ratio,
      this.ambulanceDispatched,
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
    ratio = json['ratio'];
    ambulanceDispatched = json['ambulance_dispatched'];
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
    data['ratio'] = this.ratio;
    data['ambulance_dispatched'] = this.ambulanceDispatched;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MancipalityRecord {
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

  MancipalityRecord(
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
      this.updatedAt});

  MancipalityRecord.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
