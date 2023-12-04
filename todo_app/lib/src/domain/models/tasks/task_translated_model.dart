import 'dart:convert';

TaskTranslated taskTranslatedFromJson(String str) => TaskTranslated.fromJson(json.decode(str));

String taskTranslatedToJson(TaskTranslated data) => json.encode(data.toJson());

class TaskTranslated {
  String title;
  String description;

  TaskTranslated({
    required this.title,
    required this.description,
  });

  factory TaskTranslated.fromJson(Map<String, dynamic> json) => TaskTranslated(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}