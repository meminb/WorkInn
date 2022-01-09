import 'dart:convert';

import 'package:workinn/model/Exercise.dart';

class Workout {
  late String workoutName;
  late List<Exercise?> exerciseList;
  Workout({
    required this.workoutName,
    required this.exerciseList,
  });

  Map<String, dynamic> toJson() => {
        "workoutName": workoutName,
        "exerciseList": new List.from(exerciseList.map((e) => e!.exerciseName))
      };

  Workout.fromJson(Map<String, dynamic> json)
      : workoutName = json["workoutName"],
        exerciseList = json["exerciseList"];

  @override
  String toString() =>
      'Workout( workoutName: $workoutName, exerciseList: $exerciseList)';
}
