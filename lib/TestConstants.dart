import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';

class TestConstants {
  static Exercise exercise1 = new Exercise(
      exerciseId: 1,
      exerciseName: "Ön Kol",
      gifPath: "gifPath",
      setCount: 2,
      muscleGroups: ["Ön Kol", "Omuz"],
      level: 2);
  static Exercise exercise2 = new Exercise(
      exerciseId: 1,
      exerciseName: "Ön Kol",
      gifPath: "gifPath",
      setCount: 2,
      muscleGroups: ["Ön Kol", "Arka Kol"],
      level: 2);
  static Exercise exercise3 = new Exercise(
      exerciseId: 1,
      exerciseName: "Ön Kol",
      gifPath: "gifPath",
      setCount: 2,
      muscleGroups: ["Göğüs", "Omuz"],
      level: 2);
  static Exercise exercise4 = new Exercise(
      exerciseId: 1,
      exerciseName: "Ön Kol",
      gifPath: "gifPath",
      setCount: 2,
      muscleGroups: ["Karın", "Omuz"],
      level: 2);
  static Exercise exercise5 = new Exercise(
      exerciseId: 1,
      exerciseName: "Ön Kol",
      gifPath: "gifPath",
      setCount: 2,
      muscleGroups: ["Üst Karın", "Omuz"],
      level: 2);

  static Workout workout1 = new Workout(
      id: 1,
      programName: "Üst Vücut",
      exerciseList: [exercise1, exercise2, exercise3]);
}
