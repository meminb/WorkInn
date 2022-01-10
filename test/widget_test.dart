import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workinn/Controller/WorkoutController.dart';

import 'package:workinn/main.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

void main() {
  test('Counter value should be incremented', () {
    WorkoutController workoutController =
        new WorkoutController(repository: new WorkoutRepository());
    Workout workout =
        workoutController.createCustomWorkout("name", 2, 100, 180);

    List<String> exercises = new List.empty(growable: true);
    for (var item in workout.exerciseList) {
      expect(false, exercises.contains(item!.exerciseName));
      exercises.add(item.exerciseName);
    }
  });
}
