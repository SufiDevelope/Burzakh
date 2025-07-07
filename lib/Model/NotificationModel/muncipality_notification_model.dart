class MuncipalityNotifs {
  String? message;
  List<MuncipalityNotifications>? notifications;

  MuncipalityNotifs({this.message, this.notifications});

  MuncipalityNotifs.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['notifications'] != null) {
      notifications = <MuncipalityNotifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new MuncipalityNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MuncipalityNotifications {
  int? id;
  String? notificationMessage;
  String? userId;
  String? role;
  String? createdAt;
  String? updatedAt;

  MuncipalityNotifications(
      {this.id,
      this.notificationMessage,
      this.userId,
      this.role,
      this.createdAt,
      this.updatedAt});

  MuncipalityNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationMessage = json['notification_message'];
    userId = json['user_id'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_message'] = this.notificationMessage;
    data['user_id'] = this.userId;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
