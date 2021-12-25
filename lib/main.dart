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
      extendBodyBehindAppBar: true,
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('WorkInn',
          style: TextStyle(color: Colors.deepPurple, fontFamily: 'Raleway')),
      leading: IconButton(
        icon: ImageIcon(AssetImage('assets/images/dumbbell.png'),
            color: Colors.black, size: 32),
        onPressed: () {
          // do something
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: new Icon(Icons.filter_list, color: Colors.black45, size: 32),
          onPressed: () {
            // do something
          },
        )
      ],
    );
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
