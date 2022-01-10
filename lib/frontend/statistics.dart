import 'package:flutter/material.dart';
import 'package:workinn/frontend/widgets/Common.dart';
import 'package:workinn/frontend/widgets/WorkoutHistoryWidgets.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

import '../Datas.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late List<Workout> workoutsToShown;

  @override
  initState() {
    workoutsToShown = Datas.workouts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appbar("Statistics", List<Widget>.empty()),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: workoutsToShown.length,
                itemBuilder: (BuildContext context, int index) {
                  WorkoutHistory a = new WorkoutHistory(
                      dateTime: DateTime.now(),
                      duration: 1000,
                      workout: workoutsToShown[index]);
                  return WorkoutHistoryWidgets.workoutHistoryListviewItem(
                      a, context);
                }),
          ),
        ],
      ),
    );
  }
}
