import 'dart:math';

import 'package:workinn/Datas.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class WorkoutController {
  WorkoutRepository repository;
  WorkoutController({
    required this.repository,
  });

  Future<List<Workout>> getCommonWorkoutsFromCollection() async {
    return await repository.getCommonWorkoutsFromCollection();
  }

  Future<List<Workout>> getCustomWorkoutsFromCollection() async {
    return await repository.getCustomWorkoutsFromCollection();
  }

  void saveCustomWorkoutToUser(Workout workout) {
    repository.saveCustomWorkoutToUser(workout);
  }

  Workout createCustomWorkout(String name, int goal, int weight, int height) {
    List<int> nums = new List.empty(growable: true);

    nums = _createRandomNumbers(3, nums);

    List<Exercise> exerciseList = new List.empty(growable: true);

    for (var item in nums) {
      exerciseList.add(Datas.exercises[item]);
    }

    Workout workout = new Workout(
        workoutName: name,
        exerciseList: exerciseList,
        estimatedComplateTime: 1000,
        difficultyLevel: 2);
    return workout;
  }

  List<int> _createRandomNumbers(int numberOfNumber, List<int> nums) {
    if (numberOfNumber < 1) {
      return nums;
    }

    var random = new Random();
    int num = random.nextInt(Datas.exercises.length);
    if (nums.contains(num)) {
      nums = _createRandomNumbers(numberOfNumber, nums);
    } else {
      nums.add(num);
      nums = _createRandomNumbers(numberOfNumber - 1, nums);
    }

    return nums;
  }
}
