class VideoCallScheduleModel {
  String? message;
  Data? data;

  VideoCallScheduleModel({this.message, this.data});

  VideoCallScheduleModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? date;
  String? adminId;
  String? time;
  String? meetingId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.date,
      this.adminId,
      this.time,
      this.meetingId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    adminId = json['admin_id'];
    time = json['time'];
    meetingId = json['meeting_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['admin_id'] = this.adminId;
    data['time'] = this.time;
    data['meeting_id'] = this.meetingId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
