import 'dart:convert';

class LoginModel {
  final String phoneNo;
  final String password;

  LoginModel({
    required this.phoneNo,
    required this.password,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phoneNo: json["phone_no"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "password": password,
      };
}
