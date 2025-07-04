class DubaiChatModel {
  String? message;
  List<DubaiChatData>? data;

  DubaiChatModel({this.message, this.data});

  DubaiChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DubaiChatData>[];
      json['data'].forEach((v) {
        data!.add(new DubaiChatData.fromJson(v));
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

class DubaiChatData {
  int? id;
  String? userId;
  String? adminType;
  String? message;
  String? role;
  String? createdAt;
  String? updatedAt;
  User? user;

  DubaiChatData(
      {this.id,
      this.userId,
      this.adminType,
      this.message,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.user});

  DubaiChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    adminType = json['admin_type'];
    message = json['message'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['admin_type'] = this.adminType;
    data['message'] = this.message;
    data['role'] = this.role;
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
