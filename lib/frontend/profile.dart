import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workinn/TestConstants.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () async {
          WorkoutHistoryRepository.saveWorkoutRecord(
              TestConstants.workoutHistory1);
          for (var item in WorkoutHistoryRepository.recordList) {
            print(item.toString());
          }
          for (var item in ExercisesRepository.exercises) {
            print(item.toString());
          }
          for (var item in WorkoutRepository.workouts) {
            print(item.toString());
          }
        },
      ),
    );
  }
}
