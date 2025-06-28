import 'package:burzakh/Model/AdminModels/RtaRequestDetailsModel/rta_request_details_model.dart';

class CdaRequestDetailsModel {
  String? message;
  List<CdaRequestData>? data;

  CdaRequestDetailsModel({this.message, this.data});

  CdaRequestDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CdaRequestData>[];
      json['data'].forEach((v) {
        data!.add(new CdaRequestData.fromJson(v));
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

class CdaRequestData {
  int? id;
  String? mourningStartDate;
  String? time;
  String? locationOfTent;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<CaseDetail>? caseDetail;

  CdaRequestData(
      {this.id,
      this.mourningStartDate,
      this.time,
      this.locationOfTent,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  CdaRequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mourningStartDate = json['mourning_start_date'];
    time = json['time'];
    locationOfTent = json['location_of_tent'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mourning_start_date'] = this.mourningStartDate;
    data['time'] = this.time;
    data['location_of_tent'] = this.locationOfTent;
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
  String? deviceToken;

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
      this.updatedAt,
      this.deviceToken});

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
    deviceToken = json['device_token'];
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
    data['device_token'] = this.deviceToken;
    return data;
  }
}
