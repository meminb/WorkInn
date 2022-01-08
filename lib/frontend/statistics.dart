import 'package:flutter/material.dart';
import 'package:workinn/TestConstants.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
        onPressed: () {
          
        },
      ),
    );
  }
}
