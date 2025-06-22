import 'dart:io';

class SignUpModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;
  File passportCopy;
  File? marsoom;
  File? uaePass;
  String deviceToken;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.passportCopy,
     this.marsoom,
     this.uaePass,
     required this.deviceToken,
  });
}
