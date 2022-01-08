import 'package:flutter/material.dart';
import 'package:workinn/Auth/AuthExceptionHandler.dart';
import 'package:workinn/Auth/AuthResultStatus.dart';
import 'package:workinn/Controller/UserController.dart';
import 'package:workinn/main.dart';
import 'package:workinn/repository/UserRepository.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserController controller = new UserController(new UserRepository());

  late String _email, _password, _name, _surname;

  AuthResultStatus _status = AuthResultStatus.successful;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text('Kaydol'),
      ),
      body: ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Form(
            key: _formkey,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (input) {
                        /* if (input.isEmpty) {
                            return 'Bu alan boş bırakılamaz';
                          }*/
                        return null;
                      },
                      onSaved: (input) => _email = input!,
                      decoration: decor('E-Posta'),
                    ),
                    Container(height: 12),
                    TextFormField(
                      validator: (input) {
                        /*  if (input.length < 7) {
                            return 'En az 6 karakter olmalı!';
                          }*/
                        return null;
                      },
                      onSaved: (input) => _password = input!,
                      decoration: decor('Şifre'),
                      obscureText: true,
                    ),
                    Container(height: 12),
                    TextFormField(
                      validator: (input) {
                        /* if (input.isEmpty) {
                            return 'Bu alan boş bırakılamaz';
                          }*/
                        return null;
                      },
                      onSaved: (input) => _name = input!,
                      decoration: decor('İsim:'),
                    ),
                    Container(height: 12),
                    TextFormField(
                      validator: (input) {
                        /* if (input.isEmpty) {
                            return 'Bu alan boş bırakılamaz';
                          }*/
                        return null;
                      },
                      onSaved: (input) => _surname = input!,
                      decoration: decor('Soyad:'),
                    ),
                    Container(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () {
                          setState(() async {
                            //  if (_status != AuthResultStatus.successful) {
                            signUp();
                            //  }
                          });
                          //  Navigator.of(context).pushNamed(HomePage.tag);
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.green[400],
                        child: Text('Kayıt Ol',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  signUp() async {
    final formState = _formkey.currentState;
    if (formState!.validate()) {
      formState.save();
      var result = controller.signUp(_email, _password, _name, _surname);
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Main()));
      });
    }
  }

  showInSnackBar(AuthResultStatus value) {
    var message = AuthExceptionHandler().generateExceptionMessage(value);

    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: new Text(message),
      duration: Duration(seconds: 5),
    ));
  }

  InputDecoration decor(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    );
  }
}
