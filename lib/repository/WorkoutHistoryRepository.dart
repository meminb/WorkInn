import 'package:firebase_auth/firebase_auth.dart';
import 'package:workinn/model/USER.dart';
import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/WorkoutRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutHistoryRepository {
  static List<WorkoutHistory> recordList = new List.empty(growable: true);

  static saveWorkoutRecord(WorkoutHistory history) async {
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

  static getUserWorkoutHistory() {
    if (USER.userID != "") {
      var snapshot = FirebaseFirestore.instance
          .collection('users')
          .doc(USER.userID)
          .collection("workoutHistory")
          .orderBy("dateTime")
          .get();

      snapshot.then((value) => recordList = value.docs.map((documentSnapshot) {
            var data = documentSnapshot.data();

            return new WorkoutHistory(
                workout: _findWorkoutByName(data["workout"]),
                dateTime: data["dateTime"],
                duration: data[
                    "duration"]); /* Workout.fromJson(documentSnapshot.data())*/
          }).toList());
    }
  }

  static _findWorkoutByName(String name) {
    for (var item in WorkoutRepository.workouts) {
      if (name == item.workoutName) {
        return item;
      }
    }
  }
}
