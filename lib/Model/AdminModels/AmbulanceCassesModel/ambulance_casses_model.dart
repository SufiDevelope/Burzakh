class AmbulanceCaseModel {
  bool? success;
  String? message;
  Ambulance? ambulance;

  AmbulanceCaseModel({this.success, this.message, this.ambulance});

  AmbulanceCaseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    ambulance = json['ambulance'] != null
        ? new Ambulance.fromJson(json['ambulance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.ambulance != null) {
      data['ambulance'] = this.ambulance!.toJson();
    }
    return data;
  }
}

class Ambulance {
  int? id;
  int? userId;
  String? driverName;
  String? vehicleNumber;
  String? currentLocation;
  String? contactNumber;
  String? cemetryName;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<DispatchInfo>? dispatchInfo;

  Ambulance(
      {this.id,
      this.userId,
      this.driverName,
      this.vehicleNumber,
      this.currentLocation,
      this.contactNumber,
      this.cemetryName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.dispatchInfo});

  Ambulance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    driverName = json['driver_name'];
    vehicleNumber = json['vehicle_number'];
    currentLocation = json['current_location'];
    contactNumber = json['contact_number'];
    cemetryName = json['cemetry_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['dispatch_info'] != null) {
      dispatchInfo = <DispatchInfo>[];
      json['dispatch_info'].forEach((v) {
        dispatchInfo!.add(new DispatchInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['driver_name'] = this.driverName;
    data['vehicle_number'] = this.vehicleNumber;
    data['current_location'] = this.currentLocation;
    data['contact_number'] = this.contactNumber;
    data['cemetry_name'] = this.cemetryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.dispatchInfo != null) {
      data['dispatch_info'] =
          this.dispatchInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DispatchInfo {
  int? id;
  String? caseName;
  String? standbyMosque;
  String? additionalNotes;
  String? userId;
  String? vehicleNumber;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? priority;
  List<CaseDetails>? caseDetails;
  MunicipalityAmbulanceSub? municipalityAmbulanceSub;

  DispatchInfo(
      {this.id,
      this.caseName,
      this.standbyMosque,
      this.additionalNotes,
      this.userId,
      this.vehicleNumber,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.priority,
      this.caseDetails,
      this.municipalityAmbulanceSub});

  DispatchInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseName = json['case_name'];
    standbyMosque = json['standby_mosque'];
    additionalNotes = json['additional_notes'];
    userId = json['user_id'];
    vehicleNumber = json['vehicle_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    if (json['case_details'] != null) {
      caseDetails = <CaseDetails>[];
      json['case_details'].forEach((v) {
        caseDetails!.add(new CaseDetails.fromJson(v));
      });
    }
    if (json['municipality_submission'] != null) {
      municipalityAmbulanceSub =
          MunicipalityAmbulanceSub.fromJson(json['municipality_submission']);
    }
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
    data['priority'] = this.priority;
    if (this.caseDetails != null) {
      data['case_details'] = this.caseDetails!.map((v) => v.toJson()).toList();
    }

    if (this.municipalityAmbulanceSub != null) {
      data['municipality_submission'] = this.municipalityAmbulanceSub!.toJson();
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
  int? adminId;
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

class MunicipalityAmbulanceSub {
  final int? id;
  final String? burialPlace;
  final String? burialTiming;
  final String? preferredCemetery;
  final String? userId;
  final String? caseName;
  final String? graveNumber;
  final String? sect;
  final String? religion;
  final String? specialRequest;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  MunicipalityAmbulanceSub({
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

  factory MunicipalityAmbulanceSub.fromJson(Map<String, dynamic> json) {
    return MunicipalityAmbulanceSub(
      id: json['id'],
      burialPlace: json['burial_place'],
      burialTiming: json['burial_timing'],
      preferredCemetery: json['preferred_cemetery'],
      userId: json['user_id'],
      caseName: json['case_name'],
      graveNumber: json['grave_number'],
      sect: json['sect'],
      religion: json['religion'],
      specialRequest: json['special_request'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'burial_place': burialPlace,
      'burial_timing': burialTiming,
      'preferred_cemetery': preferredCemetery,
      'user_id': userId,
      'case_name': caseName,
      'grave_number': graveNumber,
      'sect': sect,
      'religion': religion,
      'special_request': specialRequest,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
