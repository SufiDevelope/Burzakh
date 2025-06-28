class CaseNameModel {
  String? message;
  List<CaseNameData>? data;

  CaseNameModel({this.message, this.data});

  CaseNameModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CaseNameData>[];
      json['data'].forEach((v) {
        data!.add(new CaseNameData.fromJson(v));
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

class CaseNameData {
  String? nameOfDeceased;

  CaseNameData({this.nameOfDeceased});

  CaseNameData.fromJson(Map<String, dynamic> json) {
    nameOfDeceased = json['name_of_deceased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_of_deceased'] = this.nameOfDeceased;
    return data;
  }
}
