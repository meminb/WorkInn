import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workinn/Auth/AuthExceptionHandler.dart';
import 'package:workinn/Auth/AuthResultStatus.dart';
import 'package:workinn/model/USER.dart';

class UserRepository {
  signUp(String email, String password, String name, String surname) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      try {
        await user!.sendEmailVerification();
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e);
      }
      _saveUserInformation(user!, name, surname);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MainOfPages()));
      // GOES TO MAIN PAGE

      return AuthResultStatus.successful;
    } catch (e) {
      print(e);
      return await AuthExceptionHandler.handleException(e);
    }
  }

  _saveUserInformation(User user, String name, String surname) async {
    FirebaseFirestore.instance.collection("users").doc(user.uid).set(
      {
        "name": name,
        "role": "user",
        "email": user.email,
        "surname": surname, //insert body features
      },
    ).then((value) async {
      _setUserModel(user);
    });
  }

  _setUserModel(User user) async {
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    USER.userID = user.uid;
    USER.name = docSnap.get("surname");
    USER.surname = docSnap.get('name');
  }

  Future<AuthResultStatus> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return AuthResultStatus.successful;
    } catch (e) {
      return AuthExceptionHandler.handleException(e);
    }
  }
}
