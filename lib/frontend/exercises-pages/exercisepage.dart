import 'dart:async';
import 'package:flutter/material.dart';
import 'package:workinn/frontend/exercises-pages/exercisemain.dart';
import 'package:workinn/model/Exercise.dart';

class ExercisePage extends StatefulWidget {
  final List<Exercise?> listOfExercises;
  const ExercisePage(this.listOfExercises);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int _currentExerciseIndex = 0;
  int _currentIndex = 0;
  IconData iconPlayOrPause = Icons.play_arrow;
  int _counter = 20;
  Timer? _timer = null;
  bool isSetTime = false;

  int _workoutCounter = 0;
  Timer? _workoutTimer = null;

  @protected
  @mustCallSuper
  void initState() {
    _workoutTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _workoutCounter++;
      });
    });
  }

  void _stopWorkoutTimer() {
    _workoutTimer!.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        print(_counter);
        if (_counter > 0) {
          _counter--;
        } else {
          isSetTime = false;
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
  }

  void _onItemTapped(int index) {
    print(index);
    switch (index) {
      case 0:
        {
          if (_currentExerciseIndex > 0) {
            dispose();
            isSetTime = false;
            _currentExerciseIndex--;
          }
          iconPlayOrPause = Icons.play_arrow;
        }
        break;

      case 1:
        {
          if (iconPlayOrPause == Icons.pause) {
            _stopWorkoutTimer();
            iconPlayOrPause = Icons.play_arrow;
            dispose();
          } else {
            iconPlayOrPause = Icons.pause;
            _startTimer();
          }
        }
        break;

      case 2:
        {
          if (_currentExerciseIndex < widget.listOfExercises.length - 1) {
            dispose();
            isSetTime = false;
            _currentExerciseIndex++;
          }
          iconPlayOrPause = Icons.play_arrow;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
        backgroundColor: Colors.deepPurple,
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
                      if (widget
                              .listOfExercises[_currentExerciseIndex]!.setCount
                              .toString() ==
                          "0") {
                        if (!isSetTime) {
                          _counter = widget
                              .listOfExercises[_currentExerciseIndex]!.setTime;
                          print(_counter);
                          isSetTime = true;
                        }
                        return "$_counter";
                      }
                      return "${widget.listOfExercises[_currentExerciseIndex]!.setCount.toString()}";
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
                          "x${widget.listOfExercises[_currentExerciseIndex]!.repeatCount.toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
          Image.network(widget.listOfExercises[_currentExerciseIndex]!.gifPath,
              height: 400, width: 400),
          Container(
            height: 40,
            color: Colors.deepPurple[600],
            child: Center(
                child: Text(
                    widget.listOfExercises[_currentExerciseIndex]!.exerciseName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          ),
          if (_currentExerciseIndex == widget.listOfExercises.length - 1)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                elevation: 5,
                primary: Colors.deepPurple.shade200,
              ),
              onPressed: () {
                print("A");
              },
              child: const Text('Finish Workout'),
            ),
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
}
