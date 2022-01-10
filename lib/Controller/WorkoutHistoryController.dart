import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';

class WorkoutHistoryController {
  WorkoutHistoryRepository workoutHistoryRepository;
  WorkoutHistoryController({
    required this.workoutHistoryRepository,
  });

  saveWorkoutRecord(WorkoutHistory history) async {
    workoutHistoryRepository.saveWorkoutRecord(history);
  }

  Future<List<WorkoutHistory>> getUserWorkoutHistory() {
    return workoutHistoryRepository.getUserWorkoutHistory();
  }
}
