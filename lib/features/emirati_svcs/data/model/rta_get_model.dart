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
  });

  factory RtaGetModel.fromMap(Map<String, dynamic> map) {
    return RtaGetModel(
      id: map['id'] ?? 0,
      mourningStartDate:  DateTime.parse(map['mourning_start_date'].toString()),
      time: map['time'] ?? '',
      locationOfHouse: map['location_of_house'] ?? '',
      signsRequired: map['signs_required'] ?? '',
      customTextForSign: map['custom_text_for_sign'] ?? '',
      userId: map['user_id'].toString(),
      status: map['status'] ?? '',
      createdAt:  DateTime.parse(map['created_at'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mourning_start_date': mourningStartDate,
      'time': time,
      'location_of_house': locationOfHouse,
      'signs_required': signsRequired,
      'custom_text_for_sign': customTextForSign,
      'user_id': userId,
      'status': status,
      'created_at': createdAt,
    };
  }
}
