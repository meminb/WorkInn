import 'package:workinn/model/Exercise.dart';

class Workout {
  late int id;
  late String programName;
  late List<Exercise> exerciseList;
  Workout({
    required this.id,
    required this.programName,
    required this.exerciseList,
  });
}
