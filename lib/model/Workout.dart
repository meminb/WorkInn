import 'dart:convert';

import 'package:workinn/model/Exercise.dart';

class Workout {
  late String workoutName;
  late int estimatedComplateTime;
  late int difficultyLevel;
  late List<Exercise?> exerciseList;
  Workout(
      {required this.workoutName,
      required this.exerciseList,
      required this.estimatedComplateTime,
      required this.difficultyLevel});

  Map<String, dynamic> toJson() => {
        "workoutName": workoutName,
        "estimatedComplateTime": estimatedComplateTime,
        "difficultyLevel": difficultyLevel,
        "exerciseList": new List.from(exerciseList.map((e) => e!.exerciseName))
      };

  Workout.fromJson(Map<String, dynamic> json)
      : workoutName = json["workoutName"],
        exerciseList = json["exerciseList"],
        difficultyLevel = json["difficultyLevel"],
        estimatedComplateTime = json["estimatedComplateTime"];

  @override
  String toString() {
    return 'Workout(workoutName: $workoutName, estimatedComplateTime: $estimatedComplateTime, difficultyLevel: $difficultyLevel, exerciseList: $exerciseList)';
  }
}
