class RtaGetModel {
  final int id;
  final DateTime mourningStartDate;
  final String time;
  final String locationOfHouse;
  final String signsRequired;
  final String customTextForSign;
  final String userId;
  final String status;
  final DateTime createdAt;
  final String rejectedReason;
  final DateTime? mourningEndDate;
  final String case_name;

  RtaGetModel({
    required this.id,
    required this.mourningStartDate,
    required this.time,
    required this.locationOfHouse,
    required this.signsRequired,
    required this.customTextForSign,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.rejectedReason,
    required this.mourningEndDate,
    required this.case_name,
  });

  factory RtaGetModel.fromMap(Map<String, dynamic> map) {
    return RtaGetModel(
      id: map['id'] ?? 0,
      mourningStartDate: DateTime.parse(map['mourning_start_date'].toString()),
      time: map['time'] ?? '',
      locationOfHouse: map['location_of_house'] ?? '',
      signsRequired: map['signs_required'] ?? '',
      customTextForSign: map['custom_text_for_sign'] ?? '',
      userId: map['user_id'].toString(),
      status: map['status'] ?? '',
      createdAt: DateTime.parse(map['created_at'].toString()),
      rejectedReason: map['rejection_reason'] ?? '',
      mourningEndDate: map['mourning_end_date'] != null
          ? DateTime.tryParse(map['mourning_end_date'].toString())
          : null,
      case_name: map['case_name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mourning_start_date': mourningStartDate.toIso8601String(),
      'time': time,
      'location_of_house': locationOfHouse,
      'signs_required': signsRequired,
      'custom_text_for_sign': customTextForSign,
      'user_id': userId,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'rejection_reason': rejectedReason,
      'mourning_end_date': mourningEndDate?.toIso8601String(),
      'case_name': case_name,
    };
  }
}
