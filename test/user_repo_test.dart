import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workinn/Auth/AuthResultStatus.dart';
import 'package:workinn/Controller/UserController.dart';
import 'package:workinn/main.dart';
import 'package:workinn/repository/UserRepository.dart';

Future main() async {
  await Firebase.initializeApp();
  testWidgets("failing test example", (WidgetTester tester) async {
    UserController controller = new UserController(new UserRepository());

    var result = await controller.signUp(
        "email1@hotmail.com", "password1", "name1", "surname1");
    expect(result, AuthResultStatus.successful);
  });
}
