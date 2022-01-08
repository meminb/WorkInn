import 'package:workinn/model/Workout.dart';

class WorkoutRecord {
  late int id;
  late Workout workout;
  late DateTime dateTime;
  late int duration;
  WorkoutRecord({
    required this.id,
    required this.workout,
    required this.dateTime,
    required this.duration,
  });

  @override
  String toString() {
    return 'WorkoutRecord(id: $id, workout: $workout, dateTime: $dateTime, duration: $duration)';
  }
}
