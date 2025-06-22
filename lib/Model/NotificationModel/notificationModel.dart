class NotificationModel {
  String? message;
  List<Notifications>? notifications;

  NotificationModel({this.message, this.notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
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

class Notifications {
  int? id;
  String? message;
  Translations? translations;
  String? createdAt;

  Notifications({this.id, this.message, this.translations, this.createdAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    translations = json['translations'] != null
        ? new Translations.fromJson(json['translations'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    if (this.translations != null) {
      data['translations'] = this.translations!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Translations {
  String? en;
  String? ar;
  String? ur;
  String? ml;
  String? ru;
  String? zh;

  Translations({this.en, this.ar, this.ur, this.ml, this.ru, this.zh});

  Translations.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
    ur = json['ur'];
    ml = json['ml'];
    ru = json['ru'];
    zh = json['zh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    data['ur'] = this.ur;
    data['ml'] = this.ml;
    data['ru'] = this.ru;
    data['zh'] = this.zh;
    return data;
  }

  String? operator [](String langCode) {
    switch (langCode) {
      case 'en':
        return en;
      case 'ar':
        return ar;
      case 'ur':
        return ur;
      case 'ml':
        return ml;
      case 'ru':
        return ru;
      case 'zh':
        return zh;
      default:
        return en; // fallback
    }
  }
}
