class GetActiveMorticiansModel {
  String? message;
  List<ActiveMorticians>? morticians;

  GetActiveMorticiansModel({this.message, this.morticians});

  GetActiveMorticiansModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Morticians'] != null) {
      morticians = <ActiveMorticians>[];
      json['Morticians'].forEach((v) {
        morticians!.add(new ActiveMorticians.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.morticians != null) {
      data['Morticians'] = this.morticians!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveMorticians {
  int? id;
  String? name;
  String? caseName;
  String? userId;
  String? phoneNumber;
  String? status;
  String? createdAt;
  String? updatedAt;

  ActiveMorticians(
      {this.id,
      this.name,
      this.caseName,
      this.userId,
      this.phoneNumber,
      this.status,
      this.createdAt,
      this.updatedAt});

  ActiveMorticians.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['case_name'] = this.caseName;
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
