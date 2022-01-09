import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class WorkoutController {
  WorkoutRepository repository;
  WorkoutController({
    required this.repository,
  });

  Future<List<Workout>> assignCommonWorkoutsFromCollection() async {
    return await repository.assignCommonWorkoutsFromCollection();
  }

  Future<List<Workout>> assignCustomWorkoutsFromCollection() async {
    return await repository.assignCustomWorkoutsFromCollection();
  }

  void saveCustomWorkoutToUser(Workout workout) {
    repository.saveCustomWorkoutToUser(workout);
  }
}
