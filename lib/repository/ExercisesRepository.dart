import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workinn/model/Exercise.dart';

class ExercisesRepository {
  Future<List<Exercise>> assignExercisesFromDB() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('exercises').get();

    return snapshot.docs
        .map((documentSnapshot) => Exercise.fromJson(documentSnapshot.data()))
        .toList();
  }
}
