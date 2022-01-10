import 'package:flutter/material.dart';

class Common {
  static AppBar appbar(String title, List<Widget> actionButtons) {
    return AppBar(
      backgroundColor: Colors.deepPurple.shade50,
      elevation: 0,
      title: Text(title,
          style: TextStyle(color: Colors.deepPurple, fontFamily: 'Raleway')),
      leading: IconButton(
        icon: ImageIcon(AssetImage('assets/images/dumbbell.png'),
            color: Colors.black, size: 32),
        onPressed: () {
          // do something
        },
      ),
      actions: actionButtons,
    );
  }
}
