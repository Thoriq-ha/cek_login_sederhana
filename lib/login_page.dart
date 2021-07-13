import 'package:flutter/material.dart';

import 'home_page.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 27),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        _key.currentState.showSnackBar(SnackBar(content: new Text('Username Tidak Boleh kosong'),));
                      }
                      return null;
                    },
                    controller: myUsernameController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12, width: 2.0),
                      ),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        _key.currentState.showSnackBar(SnackBar(content: new Text('Password Tidak Boleh kosong'),));
                      }
                      return null;
                    },
                    obscureText: _isHidePassword,
                    controller: myPasswordController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 2.0),
                        ),
                        hintText: 'Enter Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _togglePasswordVisibility();
                          },
                          child: Icon(
                            _isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isHidePassword ? Colors.grey : Colors.blue,
                          ),
                        ),
                        isDense: true),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: MaterialButton(
                    color: Colors.blue[300],
                    onPressed: () {
                      nUsername = myUsernameController.text;
                      nPassword = myPasswordController.text;

                      if (_formKey.currentState.validate()) {
                        if (nUsername != 'summer12') {
                          _key.currentState.showSnackBar(SnackBar(content: new Text('Username salah'),));
                        } else if (nPassword != 'summer12') {
                          _key.currentState.showSnackBar(SnackBar(content: new Text('password salah'),));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    nama: nUsername,
                                    password: nPassword,
                                  )));
                        }
                      }
                      ;
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}