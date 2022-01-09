import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';

class TestConstants {
  static Exercise exercise1 = new Exercise(
      exerciseName: "Jumping Jacks",
      gifPath:
          "https://cdn.dribbble.com/users/2266447/screenshots/6234099/girl_exercise.gif",
      setCount: 0,
      repeatCount: 2,
      setTime: 20,
      muscleGroups: ["Full-body", "Large Muscle Groups"],
      level: 1);
  static Exercise exercise2 = new Exercise(
      exerciseName: "Russian Twist",
      gifPath:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/766/fitgif-friday-weighted-russian-twist-slider-thumbnail-override-1515520081.gif?crop=1xw:0.786xh;center,top&resize=1200:*",
      setCount: 3,
      repeatCount: 20,
      setTime: 0,
      muscleGroups: ["Obliques", "Rectus Abdominis"],
      level: 2);
  static Exercise exercise3 = new Exercise(
      exerciseName: "Mountain Climber",
      gifPath:
          "https://media1.popsugar-assets.com/files/thumbor/Iu8waoj6rmL6c7B8gZUdS1ZIa3I/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2017/06/08/791/n/1922729/c4943793a2ba2dd5_SlowerClimbers.gif",
      setCount: 16,
      repeatCount: 3,
      setTime: 0,
      muscleGroups: ["Shoulders", "Triceps", "Quads", "Core"],
      level: 3);
  static Exercise exercise4 = new Exercise(
      exerciseName: "Plank",
      gifPath:
          "https://thumbs.gfycat.com/OpulentZanyBumblebee-size_restricted.gif",
      setCount: 0,
      repeatCount: 2,
      setTime: 20,
      muscleGroups: ["Transversus abdominis", "Rectus abdominis"],
      level: 2);
  static Exercise exercise5 = new Exercise(
      exerciseName: "Heel Touch",
      gifPath:
          "https://i.pinimg.com/originals/f4/b0/f3/f4b0f3093fcadd64968e4c46d1767b50.gif",
      setCount: 20,
      repeatCount: 3,
      setTime: 0,
      muscleGroups: ["Oblique muscles"],
      level: 2);

  static Workout workout1 = new Workout(
      workoutName: "ABS",
      exerciseList: [exercise1, exercise2, exercise3, exercise4, exercise5]);
}
