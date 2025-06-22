class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String passportCopy;
  final String marsoom;
  final String uaePass;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String admin_type;
  final String device_token;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.passportCopy,
    required this.marsoom,
    required this.uaePass,
    required this.createdAt,
    required this.updatedAt,
    required this.admin_type,
    required this.device_token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name']??"",
      lastName: json['last_name']??"",
      email: json['email']??"",
      phoneNumber: json['phone_number']??"",
      password: json['password']??"",
      passportCopy: json['passport_copy']??"",
      marsoom: json['marsoom']??"",
      uaePass: json['uae_pass']??"",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      admin_type: json['admin_type']??"",
      device_token: json['device_token']??"",
    );
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone_number': phoneNumber,
    'password': password,
    'passport_copy': passportCopy,
    'marsoom': marsoom,
    'uae_pass': uaePass,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'admin_type': admin_type,
    'device_token': device_token,
  };
}
