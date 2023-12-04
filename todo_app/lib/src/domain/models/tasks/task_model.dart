import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  String id;
  String idUser;
  String title;
  String description;
  String status;
  String date;

  TaskModel({
    this.id = '',
    required this.idUser,
    required this.title,
    required this.description,
    this.status = '',
    this.date = ''
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"] ?? '',
    idUser: json["id_user"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    status: json["status"] ?? '',
    date: json["date"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "title": title,
    "description": description,
    "status": status,
    "date": date,
  };
}