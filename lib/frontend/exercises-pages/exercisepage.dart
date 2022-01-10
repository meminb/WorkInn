// ignore_for_file: must_call_super

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:workinn/Controller/WorkoutHistoryController.dart';
import 'package:workinn/frontend/exercises-pages/exercisemain.dart';
import 'package:workinn/frontend/widgets/CreateFeedBackPopup.dart';
import 'package:workinn/model/Exercise.dart';
import 'package:workinn/model/Workout.dart';
import 'package:workinn/model/WorkoutHistory.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';

class ExercisePage extends StatefulWidget {
  final Workout workout;
  const ExercisePage(this.workout);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  WorkoutHistoryController workoutHistoryController =
      new WorkoutHistoryController(
          workoutHistoryRepository: new WorkoutHistoryRepository());
  int _currentExerciseIndex = 0;
  int _currentIndex = 1;
  IconData iconPlayOrPause = Icons.pause;
  bool isPauseTimer = false;
  int _workoutCounter = 0;
  Timer? _workoutTimer = null;

  @protected
  @mustCallSuper
  void initState() {
    _startWorkoutTimer();
  }

  void _startWorkoutTimer() {
    if (!isPauseTimer) {
      _workoutTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _workoutCounter++;
        });
      });
    }
  }

  void _finishWorkoutTimer() {
    _workoutTimer!.cancel();
    WorkoutHistory workoutHistory = new WorkoutHistory(
        workout: widget.workout,
        dateTime: DateTime.now(),
        duration: _workoutCounter * 1000);

    workoutHistoryController.saveWorkoutRecord(workoutHistory);
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          if (_currentExerciseIndex > 0) {
            setState(() {
              _currentExerciseIndex--;
            });
          }
        }
        break;

      case 1:
        {
          _workoutTimer!.cancel();
          if (iconPlayOrPause == Icons.pause) {
            setState(() {
              iconPlayOrPause = Icons.play_arrow;
              isPauseTimer = true;
            });
          } else {
            setState(() {
              iconPlayOrPause = Icons.pause;
              isPauseTimer = false;
            });
            _startWorkoutTimer();
          }
        }
        break;

      case 2:
        {
          if (_currentExerciseIndex < widget.workout.exerciseList.length - 1) {
            setState(() {
              _currentExerciseIndex++;
            });
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.workout.workoutName),
                  SizedBox(width: 20),
                  Text(
                    "Time: $_workoutCounter",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text((() {
                      if (widget.workout.exerciseList[_currentExerciseIndex]!
                              .repeatCount
                              .toString() ==
                          "0") {
                        return "${widget.workout.exerciseList[_currentExerciseIndex]!.setTime}sec";
                      }
                      return "${widget.workout.exerciseList[_currentExerciseIndex]!.repeatCount.toString()}rep";
                    })(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: Colors.amber[800],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(
                          "x${widget.workout.exerciseList[_currentExerciseIndex]!.setCount.toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
          Image.network(
              widget.workout.exerciseList[_currentExerciseIndex]!.gifPath,
              height: 400,
              width: 400),
          Container(
            height: 40,
            color: Colors.deepPurple[600],
            child: Center(
                child: Text(
                    widget.workout.exerciseList[_currentExerciseIndex]!
                        .exerciseName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          ),
          if (_currentExerciseIndex == widget.workout.exerciseList.length - 1)
            ElevatedButton(
              child: Text('Finish Workout'),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                elevation: 5,
                primary: Colors.deepPurple.shade200,
              ),
              onPressed: () {
                _finishWorkoutTimer();
                _showMyDialog();
              },
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(iconPlayOrPause),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios),
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
    ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[CreateFeedBackPopup()],
            ),
          ),
        );
      },
    );
  }
}
