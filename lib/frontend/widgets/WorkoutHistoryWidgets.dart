import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workinn/frontend/exercises-pages/exercisemain.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';

class WorkoutHistoryWidgets {
  static Widget workoutHistoryListviewItem(
      WorkoutHistory workoutHistory, BuildContext context) {
    for (var item in workoutHistory.workout.exerciseList) {
      print(item);
    }
    return Card(
      elevation: 5,
      child: ListTile(
          title: Text(workoutHistory.workout.workoutName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 5),
              Text("Date Time: ${workoutHistory.dateTime}"),
              SizedBox(height: 5),
              Text("Duration of Workout: ${workoutHistory.duration}")
            ],
          ),
          trailing: Icon(
            Icons.accessibility,
            color: Colors.yellow[800],
          ),
          onTap: () {
            null;
          }),
    );
  }
}
