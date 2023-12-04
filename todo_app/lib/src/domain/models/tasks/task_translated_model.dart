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
    title: json["titleEnglish"],
    description: json["descriptionEnglish"],
  );

  Map<String, dynamic> toJson() => {
    "titleEnglish": title,
    "descriptionEnglish": description,
  };
}