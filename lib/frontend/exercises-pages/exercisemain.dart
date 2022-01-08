import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workinn/frontend/exercises-pages/exercisepage.dart';
import 'package:workinn/model/Exercise.dart';

import '../../TestConstants.dart';

class ExerciseMain extends StatefulWidget {
  final List<Exercise> listOfExercises;
  const ExerciseMain(this.listOfExercises);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<ExerciseMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: ListView(children: [
      Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            TestConstants.workout1.programName,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        color: Colors.deepPurple,
      ),
      for (var item in widget.listOfExercises)
        Card(
          elevation: 5,
          child: ListTile(
              title: Text(item.exerciseName),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 5),
                    Text("Exercise Level: ${item.level}"),
                    SizedBox(height: 5),
                    Text("Muscle Groups Level: ${item.muscleGroups}")
                  ]),
              onTap: () {}),
        ),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
            elevation: 5,
            primary: Colors.deepPurple.shade200,
          ),
          onPressed: () {
            Get.to(ExercisePage(widget.listOfExercises));
          },
          child: const Text('Start Workout'),
        ),
      ),
    ])));
  }
}
