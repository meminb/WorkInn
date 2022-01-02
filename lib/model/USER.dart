import 'package:firebase_auth/firebase_auth.dart';

class USER {
  static String name = "";
  static String surname = "";
  static String userID = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user;
    // here you write the codes to input the data into firestore
  }

  setUserInfo() {}
}
