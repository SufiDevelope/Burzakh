import 'dart:convert';

import 'package:flutter/material.dart';

class RtaModel {
  String address;
  String time;
  DateTime dateTime;
  String userId;
  String requiredSign;
  String customSign;

  RtaModel({
    required this.address,
    required this.time,
    required this.dateTime,
    required this.userId,
    required this.customSign,
    required this.requiredSign,
  });

  factory RtaModel.fromJson(Map<String, dynamic> json) {
    return RtaModel(
      address: json['location_of_house'],
      requiredSign: json['sign_required'],
      customSign: json['custom_text_for_sign'],
      time: json['time'],
      dateTime: DateTime.parse(json['dateTime']),
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_of_house': address,
      'signs_required': requiredSign,
      'custom_text_for_sign': customSign,
      'time': time,
      'mourning_start_date': dateTime.toString(),
      'user_id': userId,
    };
  }
}
