import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';

class TestConstants {
  static Exercise exercise1 = new Exercise(
      exerciseName: "Jumping Jacks",
      gifPath:
          "https://cdn.dribbble.com/users/2931468/screenshots/5720362/media/c676b4da711c7ec96b67e027fd83a1af.gif",
      setCount: 0,
      setTime: 40,
      muscleGroups: ["Full-body", "Large Muscle Groups"],
      level: 1);
  static Exercise exercise2 = new Exercise(
      exerciseName: "Russian Twist",
      gifPath:
          "https://media1.popsugar-assets.com/files/thumbor/mGHkJCeTQW9zK0kQwh5sfYfh3uI/fit-in/1024x1024/filters:gifv-!!-/2017/10/16/941/n/1922729/0eae23e50b82aa47_Kat-Russian-Twist-Square/i/Russian-Twist.gif",
      setCount: 20,
      setTime: 0,
      muscleGroups: ["Obliques", "Rectus Abdominis"],
      level: 2);
  static Exercise exercise3 = new Exercise(
      exerciseName: "Mountain Climber",
      gifPath:
          "https://media1.popsugar-assets.com/files/thumbor/Iu8waoj6rmL6c7B8gZUdS1ZIa3I/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2017/06/08/791/n/1922729/c4943793a2ba2dd5_SlowerClimbers.gif",
      setCount: 16,
      setTime: 0,
      muscleGroups: ["Shoulders", "Triceps", "Quads", "Core"],
      level: 3);
  static Exercise exercise4 = new Exercise(
      exerciseName: "Plank",
      gifPath:
          "https://thumbs.gfycat.com/OpulentZanyBumblebee-size_restricted.gif",
      setCount: 0,
      setTime: 20,
      muscleGroups: ["Transversus abdominis", "Rectus abdominis"],
      level: 2);
  static Exercise exercise5 = new Exercise(
      exerciseName: "Heel Touch",
      gifPath: "https://media3.giphy.com/media/HRTRkBuLpUqI6CrJhf/200.gif",
      setCount: 20,
      setTime: 0,
      muscleGroups: ["Oblique muscles"],
      level: 2);

  static Workout workout1 = new Workout(
      workoutName: "ABS",
      exerciseList: [exercise1, exercise2, exercise3, exercise4, exercise5]);
}
