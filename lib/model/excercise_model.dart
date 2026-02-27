// To parse this JSON data, do
//
//     final exerciseResponseModel = exerciseResponseModelFromJson(jsonString);

import 'dart:convert';

ExerciseResponseModel exerciseResponseModelFromJson(String str) => ExerciseResponseModel.fromJson(json.decode(str));

String exerciseResponseModelToJson(ExerciseResponseModel data) => json.encode(data.toJson());

class ExerciseResponseModel {
  List<Exercise>? exercises;

  ExerciseResponseModel({
    this.exercises,
  });

  factory ExerciseResponseModel.fromJson(Map<String, dynamic> json) => ExerciseResponseModel(
    exercises: json["exercises"] == null ? [] : List<Exercise>.from(json["exercises"]!.map((x) => Exercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "exercises": exercises == null ? [] : List<dynamic>.from(exercises!.map((x) => x.toJson())),
  };
}

class Exercise {
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;

  Exercise({
    this.id,
    this.title,
    this.thumbnail,
    this.gif,
    this.seconds,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    gif: json["gif"],
    seconds: json["seconds"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "thumbnail": thumbnail,
    "gif": gif,
    "seconds": seconds,
  };
}
