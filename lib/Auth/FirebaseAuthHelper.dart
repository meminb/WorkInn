import 'package:firebase_auth/firebase_auth.dart';
import 'AuthExceptionHandler.dart';
import 'AuthResultStatus.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;

  Future<AuthResultStatus> createAccount({email, pass}) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<AuthResultStatus> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
/*
      FirebaseUser userFirebase = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: pass))
          .user; //aşağısı çokomelli
      DocumentSnapshot docSnap = await Firestore.instance
          .collection("users")
          .document(userFirebase.uid)
          .get();
      Constants.profilePicUrl = docSnap.data['ppUrl'];
      Constants.firebaseUser = userFirebase;
      Constants.myName = userFirebase.email;
      Constants.position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
*/

    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }
}
