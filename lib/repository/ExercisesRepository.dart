import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workinn/model/Exercise.dart';

class ExercisesRepository {
  static List<Exercise> exercises = new List.empty(growable: true);

  static assignExercisesFromDB() async {
    var snapshot = FirebaseFirestore.instance.collection('exercises').get();

    snapshot.then((value) => exercises = value.docs
        .map((documentSnapshot) => Exercise.fromJson(documentSnapshot.data()))
        .toList());
  }
}
