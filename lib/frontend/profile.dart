import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:workinn/Controller/WorkoutController.dart';
import 'package:workinn/Controller/WorkoutHistoryController.dart';
import 'package:workinn/Datas.dart';
import 'package:workinn/frontend/widgets/Common.dart';
import 'package:workinn/frontend/widgets/CreateWorkoutForm.dart';
import 'package:workinn/frontend/widgets/WorkoutWidgets.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  WorkoutController? workoutController =
      new WorkoutController(repository: new WorkoutRepository());
  WorkoutHistoryController workoutHistoryController =
      new WorkoutHistoryController(
          workoutHistoryRepository: new WorkoutHistoryRepository());

  var _actionButtons = new List<Widget>.from([
    IconButton(
      icon: new Icon(Icons.notifications, color: Colors.black45, size: 32),
      onPressed: () {
        // do something
      },
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appbar("Profile", _actionButtons),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                    colors:
                        new List.from([Colors.purple[200], Colors.purple]))),
            child: Center(
                child: Text(
              "Ongoing Workouts",
              style: TextStyle(fontSize: 16),
            )),
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                    colors: new List.from([Colors.red[200], Colors.red]))),
            child: Center(
                child: Text(
              "Custom Workouts",
              style: TextStyle(fontSize: 16),
            )),
          ),
          Expanded(
            child: FutureBuilder<List<Workout>>(
              future: workoutController!
                  .getCustomWorkoutsFromCollection(), // async work
              builder: (BuildContext context,
                  AsyncSnapshot<List<Workout>> snapshot) {
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
                            return WorkoutWidgets.workoutListviewItem(
                                snapshot.data![index], context);
                          });
                }
              },
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showMyDialog();
          await Future.delayed(Duration(seconds: 2));

          setState(() {});
        },
        highlightElevation: 50,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Before you create your exercise program, there is some information you need to fill in. Please fill all.'),
                CreateWorkoutForm(
                  workoutController: workoutController,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
