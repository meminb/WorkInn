import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workinn/frontend/exercises-pages/exercisemain.dart';
import 'package:workinn/model/Workout.dart';

class WorkoutWidgets {
  static Widget workoutListviewItem(Workout workout, BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
          title: Text(workout.workoutName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 5),
              Text(
                  "Exercises: ${workout.exerciseList[0]!.exerciseName},${workout.exerciseList[1]!.exerciseName} ..."),
              SizedBox(height: 5),
              Text("Number of Exercises: ${workout.exerciseList.length}")
            ],
          ),
          trailing: Icon(
            Icons.star,
            color: Colors.yellow[800],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExerciseMain(workout)));
            // Get.to(ExerciseMain(workout.exerciseList));
          }),
    );
  }
}
