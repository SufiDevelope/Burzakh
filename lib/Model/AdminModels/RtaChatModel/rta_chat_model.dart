class RtaChatModel {
  String? message;
  List<RtaChatData>? data;

  RtaChatModel({this.message, this.data});

  RtaChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <RtaChatData>[];
      json['data'].forEach((v) {
        data!.add(new RtaChatData.fromJson(v));
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

class RtaChatData {
  int? id;
  String? userId;
  String? adminType;
  String? message;
  String? role;
  String? createdAt;
  String? updatedAt;

  RtaChatData(
      {this.id,
      this.userId,
      this.adminType,
      this.message,
      this.role,
      this.createdAt,
      this.updatedAt});

  RtaChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    adminType = json['admin_type'];
    message = json['message'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
