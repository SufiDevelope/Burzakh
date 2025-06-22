

class CdaModel {
  String address;
  String time;
  DateTime dateTime;
  String userId;

  CdaModel({
    required this.address,
    required this.time,
    required this.dateTime,
    required this.userId,
  });

  factory CdaModel.fromJson(Map<String, dynamic> json) {
    return CdaModel(
      address: json['address'],
      time: json['time'],
      dateTime: DateTime.parse(json['dateTime']),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_of_tent': address,
      'time': time,
      'mourning_start_date': dateTime.toString(),
      'user_id': userId,
    };
  }
}
