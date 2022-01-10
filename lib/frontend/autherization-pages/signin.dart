import 'package:flutter/material.dart';
import 'package:workinn/Auth/AuthExceptionHandler.dart';
import 'package:workinn/Auth/AuthResultStatus.dart';
import 'package:workinn/Controller/UserController.dart';
import 'package:workinn/frontend/autherization-pages/signup.dart';
import 'package:workinn/main.dart';
import 'package:workinn/repository/UserRepository.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _email = TextEditingController(), _password = TextEditingController();
  UserController controller = new UserController(new UserRepository());
  @override
  Widget build(BuildContext context) {
    // signIn("kucuksaid@hotmail.com", "123123123"); //auto login
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Center(
        child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    height: 250,
                    width: 250,
                    child: Image.asset('assets/images/logo.png')),
                Container(height: 12),
                TextFormField(
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'Please type something';
                    }
                  },
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                Container(height: 12),
                TextFormField(
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'password lenght is too short';
                    }
                  },
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {
                      //print(_email.text);
                      //signIn(_email.text, _password.text);
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.deepPurple[400],
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.white)),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Forgot Password!',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {
                    //   waitingForGo();
                  },
                ),
                FlatButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
            )),
      ),
    );
  }

  signIn(String email, String password) async {
    AuthResultStatus result = await controller.signIn(email, password);

    if (result == AuthResultStatus.successful) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
    } else {
      showInSnackBar(result);
    }
  }

  void showInSnackBar(AuthResultStatus value) {
    var message = AuthExceptionHandler().generateExceptionMessage(value);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: new Text(message),
      duration: Duration(seconds: 5),
    ));
  }
}
