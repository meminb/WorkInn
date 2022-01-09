import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workinn/Datas.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/USER.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/ExercisesRepository.dart';

class WorkoutRepository {
  Future<List<Workout>> assignCommonWorkoutsFromCollection() async {
    var snapshot = FirebaseFirestore.instance.collection('workouts').get();
    return await _getWorkoutsFromCollection(snapshot);
  }

  Future<List<Workout>> assignCustomWorkoutsFromCollection() async {
    var snapshot = FirebaseFirestore.instance
        .collection('users')
        .doc(USER.userID)
        .collection("customWorkouts")
        .get();
    return await _getWorkoutsFromCollection(snapshot);
  }

  saveCustomWorkoutToUser(Workout workout) async {
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

  Exercise? _findExerciseByNameFromLocal(String name) {
    for (var item in Datas.exercises) {
      if (item.exerciseName == name) {
        return item;
      }
    }
    return null;
  }

  Future<List<Workout>> _getWorkoutsFromCollection(
      Future<QuerySnapshot<Map<String, dynamic>>> snapshot) async {
    List<Workout> list = new List.empty(growable: true);
    await snapshot.then((value) => list = value.docs.map((documentSnapshot) {
          var data = documentSnapshot.data();

          var exerciseNameList = data["exerciseList"];

          List<Exercise?> exerciseList = new List.empty(growable: true);
          for (String item in exerciseNameList) {
            Exercise? exercise = _findExerciseByNameFromLocal(item);
            if (exercise != null) {
              exerciseList.add(exercise);
            }
          }

          return new Workout(
              estimatedComplateTime: data["estimatedComplateTime"],
              difficultyLevel: data["difficultyLevel"],
              workoutName: data["workoutName"],
              exerciseList:
                  exerciseList); /* Workout.fromJson(documentSnapshot.data())*/
        }).toList());
    return list;
  }
}
