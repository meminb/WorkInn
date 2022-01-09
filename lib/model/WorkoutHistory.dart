import 'package:workinn/model/Workout.dart';

class WorkoutHistory {
  late Workout workout;
  late DateTime dateTime;
  late int duration;
  WorkoutHistory({
    required this.workout,
    required this.dateTime,
    required this.duration,
  });
  Map<String, dynamic> toJson() => {
        "workout": workout.workoutName,
        "dateTime": dateTime,
        "duration": duration
      };

  @override
  String toString() {
    return 'WorkoutRecord: workout: $workout, dateTime: $dateTime, duration: $duration)';
  }
}
