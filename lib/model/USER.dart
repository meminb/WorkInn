import 'package:firebase_auth/firebase_auth.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';

class USER {
  static String name = "";
  static String surname = "";
  static String userID = "";
  static late List<Workout> workoutList;
  static late List<WorkoutHistory> recordList;

  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user;
    // here you write the codes to input the data into firestore
  }

  setUserInfo() {}
}
