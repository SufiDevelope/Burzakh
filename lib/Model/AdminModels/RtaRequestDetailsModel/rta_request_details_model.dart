class RtaRequestDetailsModel {
  String? message;
  List<RequestDetailsData>? data;

  RtaRequestDetailsModel({this.message, this.data});

  RtaRequestDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <RequestDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new RequestDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestDetailsData {
  int? id;
  String? mourningStartDate;
  String? time;
  String? locationOfHouse;
  String? signsRequired;
  String? customTextForSign;
  String? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<CaseDetail>? caseDetail;
  String? mourningEndDate;

  RequestDetailsData(
      {this.id,
      this.mourningStartDate,
      this.time,
      this.locationOfHouse,
      this.signsRequired,
      this.customTextForSign,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.caseDetail, this.mourningEndDate});

  RequestDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mourningStartDate = json['mourning_start_date'];
    time = json['time'];
    locationOfHouse = json['location_of_house'];
    signsRequired = json['signs_required'];
    customTextForSign = json['custom_text_for_sign'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['case_details'] != null) {
      caseDetail = <CaseDetail>[];
      json['case_details'].forEach((v) {
        caseDetail!.add(CaseDetail.fromJson(v));
      });
    }
    mourningEndDate = json['mourning_end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mourning_start_date'] = this.mourningStartDate;
    data['time'] = this.time;
    data['location_of_house'] = this.locationOfHouse;
    data['signs_required'] = this.signsRequired;
    data['custom_text_for_sign'] = this.customTextForSign;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.caseDetail != null) {
      data['case_details'] = this.caseDetail!.map((v) => v.toJson()).toList();
    }
    data['mourning_end_date'] = this.mourningEndDate;
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
  String? createdAt;
  String? updatedAt;
  String? token;

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['device_token'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['device_token'] = this.token;
    return data;
  }
}

class CaseDetail {
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
  String? createdAt;
  String? updatedAt;
  String? passport_document;

  CaseDetail({
    this.id,
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
    this.updatedAt,
  });

  CaseDetail.fromJson(Map<String, dynamic> json) {
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
    passport_document = json['passport_document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['resting_place'] = restingPlace;
    data['police_clearance'] = policeClearance;
    data['death_notification_file'] = deathNotificationFile;
    data['death_notification_file_status'] = deathNotificationFileStatus;
    data['hospital_certificate'] = hospitalCertificate;
    data['hospital_certificate_status'] = hospitalCertificateStatus;
    data['passport_or_emirate_id_front'] = passportOrEmirateIdFront;
    data['passport_or_emirate_id_front_status'] =
        passportOrEmirateIdFrontStatus;
    data['passport_or_emirate_id_back'] = passportOrEmirateIdBack;
    data['passport_or_emirate_id_back_status'] = passportOrEmirateIdBackStatus;
    data['case_status'] = caseStatus;
    data['release_form'] = releaseForm;
    data['additional_document'] = additionalDocument;
    data['send_notification_message'] = sendNotificationMessage;
    data['admin_id'] = adminId;
    data['name_of_deceased'] = nameOfDeceased;
    data['date_of_death'] = dateOfDeath;
    data['cause_of_death'] = causeOfDeath;
    data['location'] = location;
    data['additional_document_upload_user'] = additionalDocumentUploadUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['passport_document'] = passport_document;
    return data;
  }
}
