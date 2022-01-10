import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workinn/frontend/widgets/Common.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutHistoryRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () async {},
        ),
      ),
    );
  }
}
