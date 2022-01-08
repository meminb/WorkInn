import 'package:shared_preferences/shared_preferences.dart';
import 'package:workinn/Auth/AuthResultStatus.dart';
import 'package:workinn/repository/UserRepository.dart';

class UserController {
  late UserRepository userRepository;
  UserController(this.userRepository);

  signUp(String email, String password, String name, String surname) async {
    var result = await userRepository.signUp(email, password, name, surname);

    if (result == AuthResultStatus.successful) {
      setUserToSharedPreferences(email, password);
      return AuthResultStatus.successful;
    } else {
      return result;
    }
  }

  Future<AuthResultStatus> signIn(String email, String password) async {
    AuthResultStatus status = await userRepository.signIn(email, password);

    if (status == AuthResultStatus.successful) {
      setUserToSharedPreferences(email, password);
    }
    return status;
  }

  setUserToSharedPreferences(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }
}
