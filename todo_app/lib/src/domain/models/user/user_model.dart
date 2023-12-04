import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String username;
  String email;
  String password;

  UserModel({
    this.id = "",
    required this.username,
    required this.email,
    required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? '',
    username: json["username"] ?? '',
    email: json["email"] ?? '',
    password: json["password"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}