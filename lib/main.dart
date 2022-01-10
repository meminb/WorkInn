import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workinn/Controller/Exercisecontroller.dart';
import 'package:workinn/Controller/WorkoutController.dart';
import 'package:workinn/Datas.dart';
import 'package:workinn/frontend/homepage.dart';
import 'package:workinn/frontend/profile.dart';
import 'package:workinn/frontend/statistics.dart';
import 'package:workinn/repository/ExercisesRepository.dart';
import 'package:workinn/repository/WorkoutRepository.dart';

import 'frontend/autherization-pages/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WorkoutController workoutController =
      new WorkoutController(repository: new WorkoutRepository());
  ExerciseController exerciseController =
      new ExerciseController(repository: new ExercisesRepository());

  await Firebase.initializeApp();

  Datas.exercises = await exerciseController.assignExercisesFromDB();

  Datas.workouts = await workoutController.assignCommonWorkoutsFromCollection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.sd
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: SignIn(),
    );
  }
}

List pages = [Homepage(), Statistics(), Profile()];
int _currentIndex = 0;
IconButton _leadingButton = new IconButton(
  icon: ImageIcon(AssetImage('assets/images/dumbbell.png'),
      color: Colors.black, size: 32),
  onPressed: () {
    // do something
  },
);
String _appBarTitle = 'WorkInn';
IconButton _actionButton = new IconButton(
  icon: new Icon(Icons.filter_list, color: Colors.black45, size: 32),
  onPressed: () {
    // do something
  },
);

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: pages[_currentIndex],
      bottomNavigationBar: navigationbar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //Navigation-Bar Design And Tapped Logic
  Widget navigationbar() {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                backgroundColor: Colors.deepPurple.shade50,
                selectedFontSize: 0,
                currentIndex: _currentIndex,
                onTap: _onItemTapped,
                selectedIconTheme:
                    IconThemeData(color: Colors.deepPurple.shade200),
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      label: '',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.bar_chart),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.perm_identity), label: ''),
                ]),
          )),
    );
  }
}
