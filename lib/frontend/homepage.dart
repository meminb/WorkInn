import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance.collection('data').add(
              {'text': '!!!!!!!!!WORKINN ÇALIŞIYOR TEBRİKLER!!!!!!!!!!!!'});
        },
      ),
    );
  }
}
