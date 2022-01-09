import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workinn/frontend/exercises-pages/exercisepage.dart';
import 'package:workinn/model/Exercise.dart';

import '../../TestConstants.dart';

class ExerciseMain extends StatefulWidget {
  final List<Exercise?> listOfExercises;

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
            child: Image.network(
                "https://cdn.dribbble.com/users/2789026/screenshots/6251389/yw_dribble.gif",
                height: 200,
                width: 200)),
        color: Colors.deepPurple,
      ),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          TestConstants.workout1.workoutName,
          style: TextStyle(
              color: Colors.yellow[800],
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 5),
      for (var item in widget.listOfExercises)
        Card(
          elevation: 5,
          child: ListTile(
              title: Text(item!.exerciseName),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ExercisePage(widget.listOfExercises)));
          },
          child: const Text('Start Workout'),
        ),
      ),
    ])));
  }
}
