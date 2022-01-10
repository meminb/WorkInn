import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workinn/Controller/WorkoutHistoryController.dart';
import 'package:workinn/frontend/autherization-pages/signin.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

void main() {
  WorkoutRepository workoutRepository = new WorkoutRepository();

  test('Workouts must be have workout name.', () async {
    
    List<Workout> workoutListFromRepo =
        await workoutRepository.getCustomWorkoutsFromCollection();
    for (var workout in workoutListFromRepo) {
      print(workout.workoutName);
      expect(workout.workoutName.isEmpty, true);
    }
  });
}
