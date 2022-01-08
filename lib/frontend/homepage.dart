import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workinn/TestConstants.dart';
import 'package:workinn/frontend/profile.dart';
import 'widgets/WorkoutWidgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(children: [
          WorkoutWidgets.workoutListviewItem(TestConstants.workout1),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showMyDialog(),
          highlightElevation: 50,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.purple,
        ),
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
              children: const <Widget>[
                Text(
                    'Before you create your exercise program, there is some information you need to fill in. Please fill all.'),
                CreateWorkoutForm()
              ],
            ),
          ),
        );
      },
    );
  }
}

// Create a Form widget.
class CreateWorkoutForm extends StatefulWidget {
  const CreateWorkoutForm({Key? key}) : super(key: key);

  @override
  CreateWorkoutState createState() {
    return CreateWorkoutState();
  }
}

class CreateWorkoutState extends State<CreateWorkoutForm> {
  final _formKey = GlobalKey<FormState>();
  int? _radioSelected;
  String _radioVal = "";
  final List<String> textFieldsValue = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter weight.',
            ),
            validator: (weight) {
              if (weight == null || weight.isEmpty) {
                return 'Please enter weight, this field can not be empty.';
              }
              textFieldsValue.add(weight);
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
              textFieldsValue.add(height);
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            children: [Text("Select Difficulty Level:")],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _radioSelected,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value as int;
                    _radioVal = 'Easy';
                    print(_radioVal);
                  });
                },
              ),
              Text(
                "Easy",
              ),
              Radio(
                value: 2,
                groupValue: _radioSelected,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value as int;
                    _radioVal = 'Medium';
                    print(_radioVal);
                  });
                },
              ),
              Text(
                "Medium",
              ),
              Radio(
                value: 3,
                groupValue: _radioSelected,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value as int;
                    _radioVal = 'Hard';
                    print(_radioVal);
                  });
                },
              ),
              Text(
                "Hard",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_radioVal);
                  _formKey.currentState!.validate();
                  print(textFieldsValue);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
