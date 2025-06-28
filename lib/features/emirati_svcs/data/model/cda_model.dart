class CdaModel {
  String address;
  // String time;
  DateTime dateTime;
  String userId;
  String case_name;
  DateTime? mourningEndDate;

  CdaModel({
    required this.address,
    // required this.time,
    required this.dateTime,
    required this.userId,
    required this.case_name,
    this.mourningEndDate,
  });

  factory CdaModel.fromJson(Map<String, dynamic> json) {
    return CdaModel(
      address: json['address'],
      // time: json['time'],
      dateTime: DateTime.parse(json['mourning_start_date']),
      userId: json['userId'],
      case_name: json['case_name'],
      mourningEndDate: json['mourning_end_date'] != null
          ? DateTime.parse(json['mourning_end_date'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_of_tent': address,
      // 'time': time,
      'mourning_start_date': dateTime.toString(),
      'user_id': userId,
      'case_name': case_name,
      'mourning_end_date':
          mourningEndDate != null ? mourningEndDate!.toString() : null,
    };
  }
}
