// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:workinn/Controller/WorkoutController.dart';
import 'package:workinn/model/Workout.dart';

class CreateWorkoutForm extends StatefulWidget {
  const CreateWorkoutForm({
    Key? key,
    required this.workoutController,
  }) : super(key: key);
  final WorkoutController? workoutController;

  @override
  CreateWorkoutState createState() {
    return CreateWorkoutState();
  }
}

class CreateWorkoutState extends State<CreateWorkoutForm> {
  final _formKey = GlobalKey<FormState>();
  int? _radioSelected;
  int? _height;
  int? _weight;
  String _workoutName = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Name Your Workout.',
            ),
            validator: (workout) {
              if (workout == null || workout.isEmpty) {
                return 'You need to name your workout!';
              }
              _workoutName = workout;
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter weight.',
            ),
            validator: (weight) {
              if (weight == null || weight.isEmpty) {
                return 'Please enter weight, this field can not be empty.';
              }
              _weight = int.tryParse(weight);
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter height.',
            ),
            validator: (height) {
              if (height == null || height.isEmpty) {
                return 'Please enter height, this field can not be empty.';
              }
              _height = int.tryParse(height);
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                    "Cardio :",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Fat Burning :",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Muscle Building :",
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
                ],
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(
                      "height: $_height weight: $_weight  radio: $_radioSelected");
                  Workout workout = widget.workoutController!
                      .createCustomWorkout(
                          _workoutName, _radioSelected!, _weight!, _height!);
                  widget.workoutController!.saveCustomWorkoutToUser(workout);

                  Navigator.pop(context);
                }
              },
              child: const Text('Create workout'),
            ),
          ),
        ],
      ),
    );
  }
}
