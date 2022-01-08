import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/USER.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/ExercisesRepository.dart';

class WorkoutRepository {
  static List<Workout> workouts = new List.empty(growable: true);

  static assignCommonWorkoutsFromCollection() {
    var snapshot = FirebaseFirestore.instance.collection('workouts').get();
    return _getWorkoutsFromCollection(snapshot);
  }

  static assignCustomWorkoutsFromCollection() {
    var snapshot = FirebaseFirestore.instance
        .collection('users')
        .doc(USER.userID)
        .collection("customWorkouts")
        .get();
    return _getWorkoutsFromCollection(snapshot);
  }

  static Exercise? _findExerciseByNameFromLocal(String name) {
    for (var item in ExercisesRepository.exercises) {
      if (item.exerciseName == name) {
        return item;
      }
    }
    return null;
  }

  static _getWorkoutsFromCollection(
      Future<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    snapshot.then((value) => workouts = value.docs.map((documentSnapshot) {
          var data = documentSnapshot.data();

          var exerciseNameList = data["exerciseList"];

          List<Exercise?> exerciseList = new List.empty(growable: true);
          for (var item in exerciseNameList) {
            exerciseList.add(_findExerciseByNameFromLocal(item));
          }

          return new Workout(
              workoutName: data["workoutName"],
              exerciseList:
                  exerciseList); /* Workout.fromJson(documentSnapshot.data())*/
        }).toList());
  }

  static saveCustomWorkoutToUser(Workout workout) async {
    if (FirebaseAuth.instance.currentUser != null) {
      final CollectionReference postsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(USER.userID)
          .collection("customWorkouts");

      Map<String, dynamic> postData = workout.toJson();
      print(postData.toString());
      await postsRef.doc(workout.workoutName).set(postData);
    } else {
      print("Login first!");
    }
  }
}
