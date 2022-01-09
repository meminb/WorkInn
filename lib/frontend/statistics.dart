import 'package:flutter/material.dart';
import 'package:workinn/TestConstants.dart';
import 'package:workinn/repository/WorkoutRepository.dart';
import 'widgets/StatisticsWidget.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
     return Container(
      child: Scaffold(
        body: ListView(children: [
         StatisticsWidget.workoutStatisticsListviewItem(TestConstants.workout1, context),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
          ListTile(
            title: Text("dlskfj"),
          ),
        ]),
       
      ),);
  }
}
