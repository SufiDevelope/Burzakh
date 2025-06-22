class CdaGetModel {
  final int id;
  final DateTime mourningStartDate;
  final String time;
  final String locationOfTent;
  final int userId;
  final String status;
  final DateTime createdAt;

  CdaGetModel({
    required this.id,
    required this.mourningStartDate,
    required this.time,
    required this.locationOfTent,
    required this.userId,
    required this.status,
    required this.createdAt,
  });

  factory CdaGetModel.fromMap(Map<String, dynamic> map) {
    return CdaGetModel(
      id: map['id'] ?? 0,
      mourningStartDate: DateTime.parse(map['mourning_start_date'].toString()),
      time: map['time'] ?? '',
      locationOfTent: map['location_of_tent'] ?? '',
      userId: map['user_id'] ?? 0,
      status: map['status'] ?? '',
      createdAt: DateTime.parse(map['created_at'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mourning_start_date': mourningStartDate,
      'time': time,
      'location_of_tent': locationOfTent,
      'user_id': userId,
      'status': status,
      'created_at': createdAt,
    };
  }
}
