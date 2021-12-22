import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workinn/frontend/homepage.dart';
import 'package:workinn/frontend/profile.dart';
import 'package:workinn/frontend/statistics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: Main(),
    );
  }
}

List pages = [Homepage(), Statistics(), Profile()];

int _currentIndex = 0;

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: pages[_currentIndex],
      bottomNavigationBar: navigationbar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  AppBar appbar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () => print("Demo"), icon: Icon(Icons.access_alarm))
      ],
    );
  }

  Widget navigationbar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: 'Person'),
        ]);
  }
}
