// ignore_for_file: must_call_super

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:workinn/model/Exercise.dart';

class ExercisePage extends StatefulWidget {
  final List<Exercise?> listOfExercises;
  const ExercisePage(this.listOfExercises);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int _currentIndex = 0;
  IconData iconPlayOrPause = Icons.play_arrow;
  int _counter = 20;
  Timer? _timer = null;
  bool isSetTime = false;
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
        {}
        break;

      case 1:
        {
          if (iconPlayOrPause == Icons.pause) {
            iconPlayOrPause = Icons.play_arrow;
            dispose();
          } else {
            iconPlayOrPause = Icons.pause;
            _startTimer();
          }
        }
        break;

      case 2:
        {}
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
          Container(
            height: 70,
            width: 70,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text((() {
              if (widget.listOfExercises[0]!.setCount.toString() == "0") {
                if (!isSetTime) {
                  _counter = widget.listOfExercises[0]!.setTime;
                  print(_counter);
                  isSetTime = true;
                }
                return "Time: $_counter";
              }
              return "Count: ${widget.listOfExercises[0]!.setCount.toString()}";
            })(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          ),
          GifView.network(
            widget.listOfExercises[0]!.gifPath,
            height: 400,
            width: 400,
          ),
          Container(
            height: 40,
            color: Colors.deepPurple[600],
            child: Center(
                child: Text(widget.listOfExercises[0]!.exerciseName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
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
