class RecentModel {
  final String userId;
  final String activityName;
  final Map<String, String> activityNameTranslation;
  final Map<String, String> statusTranslation;
  final String timeAgo;

  RecentModel({
    required this.userId,
    required this.activityName,
    required this.activityNameTranslation,
    required this.statusTranslation,
    required this.timeAgo,
  });

  factory RecentModel.fromMap(Map<String, dynamic> map) {
    return RecentModel(
      userId: map['user_id'] ?? '',
      activityName: map['activity_name'] ?? '',
      activityNameTranslation: Map<String, String>.from(map['activity_name_translation'] ?? {}),
      statusTranslation: Map<String, String>.from(map['status'] ?? {}),
      timeAgo: map['time_ago'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'activity_name': activityName,
      'activity_name_translation': activityNameTranslation,
      'status': statusTranslation,
      'time_ago': timeAgo,
    };
  }

  String getTranslatedName(String localeCode) {
    final langCode = localeCode.split('_').first;
    return activityNameTranslation[langCode] ?? activityName;
  }

  String getTranslatedStatus(String localeCode) {
    final langCode = localeCode.split('_').first;
    return statusTranslation[langCode] ?? '';
  }
}
