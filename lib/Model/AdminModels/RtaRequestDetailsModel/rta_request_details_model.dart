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
      this.user});

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
    return data;
  }
}
