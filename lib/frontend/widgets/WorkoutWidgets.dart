import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutWidgets {
  static Widget WokoutListViewItem() {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text('Upper Body'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 5),
            Text("Difficulty Level: Easy"),
            SizedBox(height: 5),
            Text("Time: 15min"),
            SizedBox(height: 5),
            Text("Number of Exercises: 5")
          ],
        ),
        trailing: Icon(Icons. ),
        onTap: null,
      ),
    );
  }
}
