// Create a Form widget.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workinn/Controller/WorkoutController.dart';
import 'package:workinn/frontend/profile.dart';
import 'package:workinn/frontend/statistics.dart';
import 'package:workinn/model/Workout.dart';

class CreateFeedBackPopup extends StatefulWidget {
  const CreateFeedBackPopup({
    Key? key,
  }) : super(key: key);

  @override
  CreateFeedBackPopupState createState() {
    return CreateFeedBackPopupState();
  }
}

class CreateFeedBackPopupState extends State<CreateFeedBackPopup> {
  Random random = new Random();
  int randomNumber = 0;
  final _formKey = GlobalKey<FormState>();
  int? _radioSelected;
  int? _height;
  int? _weight;
  String _workoutName = "";

  getRandom() {
    randomNumber = random.nextInt(500) + 100;
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Burned Calorie: ${getRandom()}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Select Difficulty Level:",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Easy :",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Medium :",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Hard :",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  Radio(
                    value: 2,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      elevation: 5,
                      primary: Colors.deepPurple.shade200,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
