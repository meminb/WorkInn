import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workinn/frontend/exercises-pages/exercisepage.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';

import '../../TestConstants.dart';

class ExerciseMain extends StatefulWidget {
  final Workout workout;
  const ExerciseMain(this.workout);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<ExerciseMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(widget.workout.workoutName),
                        Text(
                          "   Level: ${widget.workout.difficultyLevel}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Estimated Complate time: ${_secondToMinutes(widget.workout.estimatedComplateTime)} minutes",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(children: [
              for (var item in widget.workout.exerciseList)
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
                    //Get.to(ExercisePage(widget.listOfExercises));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ExercisePage(widget.workout.exerciseList)));
                  },
                  child: const Text('Start Workout'),
                ),
              ),
            ])));
  }

  _secondToMinutes(int sec) {
    return (sec / 60).round();
  }
}
