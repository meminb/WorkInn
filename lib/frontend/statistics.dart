import 'package:flutter/material.dart';
import 'package:workinn/frontend/widgets/Common.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appbar("Statistics", List<Widget>.empty()),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
