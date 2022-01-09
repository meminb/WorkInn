import 'package:workinn/model/Exercise.dart';
import 'package:workinn/repository/ExercisesRepository.dart';

class ExerciseController {
  late ExercisesRepository repository;
  ExerciseController({
    required this.repository,
  });

  Future<List<Exercise>> assignExercisesFromDB() {
    return repository.assignExercisesFromDB();
  }
}
