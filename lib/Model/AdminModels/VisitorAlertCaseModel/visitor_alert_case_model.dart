class VisitorAlertCaseModel {
  bool? status;
  String? message;
  int? count;
  List<VisitorAlertCaseData>? data;

  VisitorAlertCaseModel({this.status, this.message, this.count, this.data});

  VisitorAlertCaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = <VisitorAlertCaseData>[];
      json['data'].forEach((v) {
        data!.add(new VisitorAlertCaseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitorAlertCaseData {
  int? id;
  String? name;
  String? gender;
  String? alertTime;
  String? cemeteryLocation;
  String? mosqueName;
  String? description;
  String? descriptionArabic;
  String? status;
  String? makeAsImportant;
  String? createdAt;
  String? updatedAt;

  VisitorAlertCaseData(
      {this.id,
      this.name,
      this.gender,
      this.alertTime,
      this.cemeteryLocation,
      this.mosqueName,
      this.description,
      this.descriptionArabic,
      this.status,
      this.makeAsImportant,
      this.createdAt,
      this.updatedAt});

  VisitorAlertCaseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    alertTime = json['alert_time'];
    cemeteryLocation = json['cemetery_location'];
    mosqueName = json['mosque_name'];
    description = json['description'];
    descriptionArabic = json['description_arabic'];
    status = json['status'];
    makeAsImportant = json['make_as_important'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['alert_time'] = this.alertTime;
    data['cemetery_location'] = this.cemeteryLocation;
    data['mosque_name'] = this.mosqueName;
    data['description'] = this.description;
    data['description_arabic'] = this.descriptionArabic;
    data['status'] = this.status;
    data['make_as_important'] = this.makeAsImportant;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
