import 'package:flutter/material.dart';
import 'package:workinn/Controller/WorkoutHistoryController.dart';
import 'package:workinn/frontend/widgets/Common.dart';
import 'package:workinn/frontend/widgets/WorkoutHistoryWidgets.dart';
import 'package:workinn/frontend/widgets/WorkoutWidgets.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';

import '../Datas.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  WorkoutHistoryController workoutHistoryController =
      new WorkoutHistoryController(
          workoutHistoryRepository: new WorkoutHistoryRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appbar("Statistics", List<Widget>.empty()),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<WorkoutHistory>>(
              future: workoutHistoryController
                  .getUserWorkoutHistory(), // async work
              builder: (BuildContext context,
                  AsyncSnapshot<List<WorkoutHistory>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Text('Loading....');
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return WorkoutHistoryWidgets
                                .workoutHistoryListviewItem(
                                    snapshot.data![index], context);
                          });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
