import 'package:flutter/material.dart';
import 'package:workinn/Datas.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/WorkoutRepository.dart';
import 'widgets/WorkoutWidgets.dart';
import 'package:workinn/frontend/widgets/Common.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Workout> workoutsToShown;

  var _appBarTitle = 'WorkInn';
  List<Widget> _actionButtons = new List.from([
    IconButton(
      icon:
          new Icon(Icons.workspaces_outlined, color: Colors.black45, size: 32),
      onPressed: () {},
    )
  ]);
  @override
  initState() {
    workoutsToShown = Datas.workouts;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appbar(_appBarTitle, _actionButtons),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search',
                  hintText: ("Enter a muscle name e.g. \"Triceps\""),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: workoutsToShown.length,
                itemBuilder: (BuildContext context, int index) {
                  return WorkoutWidgets.workoutListviewItem(
                      workoutsToShown[index], context);
                }),
          ),
        ],
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Workout> foundedworkouts = new List.empty(growable: true);
    if (enteredKeyword.isEmpty) {
      foundedworkouts = Datas.workouts;
    } else {
      for (var workout in Datas.workouts) {
        loopOfExercise:
        for (var exercise in workout.exerciseList) {
          for (var muscle in exercise!.muscleGroups) {
            if (muscle
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase())) {
              foundedworkouts.add(workout);
              break loopOfExercise;
            }
          }
        }
      }
    }

// muscle.toString().toLowerCase().contains(enteredKeyword.toLowerCase())
    setState(() {
      workoutsToShown = foundedworkouts;
    });
  }
}
