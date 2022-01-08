import 'package:cloud_firestore/cloud_firestore.dart';

class ExercisesRepository {
  getExercisesFromDB() {}

  static getMarker() async {
    var snapshot = FirebaseFirestore.instance.collection('exercises').get();

    return snapshot.then((value) => value.docs.map((e) => e.data()));
  }
}
