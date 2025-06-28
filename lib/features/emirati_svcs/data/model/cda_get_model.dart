class CdaGetModel {
  final int id;
  final DateTime? mourningStartDate;
  final String time;
  final String locationOfTent;
  final int userId;
  final String status;
  final DateTime createdAt;
  final String rejectedReason;
  final String case_name;
  final DateTime? mourningEndDate;

  CdaGetModel({
    required this.id,
    required this.mourningStartDate,
    required this.time,
    required this.locationOfTent,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.rejectedReason,
    required this.case_name,
    this.mourningEndDate,
  });

  factory CdaGetModel.fromMap(Map<String, dynamic> map) {
    return CdaGetModel(
      id: map['id'] ?? 0,
      mourningStartDate: map['mourning_start_date'] != null
          ? DateTime.parse(map['mourning_start_date'].toString())
          : null,
      time: map['time'] ?? '',
      locationOfTent: map['location_of_tent'] ?? '',
      userId: map['user_id'] ?? 0,
      status: map['status'] ?? '',
      createdAt: DateTime.parse(map['created_at'].toString()),
      rejectedReason: map['rejection_reason'] ?? '',
      case_name: map['case_name'] ?? '',
      mourningEndDate: map['mourning_end_date'] != null
          ? DateTime.parse(map['mourning_end_date'].toString())
          : null,
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
      'rejection_reason': rejectedReason,
      'case_name': case_name,
      'mourning_end_date': mourningEndDate
    };
  }
}
