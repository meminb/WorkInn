import 'package:firebase_auth/firebase_auth.dart';
import 'package:workinn/Datas.dart';
import 'package:workinn/model/USER.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/WorkoutRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutHistoryRepository {
  saveWorkoutRecord(WorkoutHistory history) async {
    if (FirebaseAuth.instance.currentUser != null) {
      final CollectionReference postsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(USER.userID)
          .collection("workoutHistory");

      Map<String, dynamic> postData = history.toJson();
      print(postData.toString());
      await postsRef.doc(history.dateTime.toString()).set(postData);
    } else {
      print("Login first!");
    }
  }

  Future<List<WorkoutHistory>> getUserWorkoutHistory() async {
    if (USER.userID != "") {
      var snapshot = FirebaseFirestore.instance
          .collection('users')
          .doc(USER.userID)
          .collection("workoutHistory")
          .get();
      List<WorkoutHistory> recordList = new List.empty(growable: true);
      await snapshot
          .then((value) => recordList = value.docs.map((documentSnapshot) {
                var data = documentSnapshot.data();

                return new WorkoutHistory(
                    workout: _findWorkoutByName(data["workout"]),
                    dateTime: (data["dateTime"].toDate()),
                    duration: (data["duration"] / 1000).round());
              }).toList());
      return recordList;
    }
    print("No User");
    return List.empty();
  }

  static _findWorkoutByName(String name) {
    for (var item in Datas.workouts) {
      if (name == item.workoutName) {
        return item;
      }
    }
  }

  Future<List<Workout>> getLast2WorkoutHistoryFromRepository() async {
    if (USER.userID != "") {
      var snapshot = FirebaseFirestore.instance
          .collection('users')
          .doc(USER.userID)
          .collection("workoutHistory")
          .get();
      List<Workout> lastTwoWorkout = new List.empty(growable: true);
      List<WorkoutHistory> recordHistoryList = new List.empty(growable: true);
      await snapshot.then(
          (value) => recordHistoryList = value.docs.map((documentSnapshot) {
                var data = documentSnapshot.data();

                return new WorkoutHistory(
                    workout: _findWorkoutByName(data["workout"]),
                    dateTime: (data["dateTime"].toDate()),
                    duration: (data["duration"] / 1000).round());
              }).toList());
      lastTwoWorkout.add(recordHistoryList[0].workout);
      lastTwoWorkout.add(recordHistoryList[1].workout);
      return lastTwoWorkout;
    }
    print("No User");
    return List.empty();
  }
}
