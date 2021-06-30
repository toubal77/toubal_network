import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toubal_network/chat/pickers/user_image_picker.dart';
import 'package:toubal_network/social/home_widget.dart';
import 'package:toubal_network/chat/services/auth.dart';
import 'package:toubal_network/chat/services/database.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var _isLogin = true;
  var _isLoading = false;
  // ignore: unused_field
  late File _userImageFile;
  // ignore: unused_element
  void _pickedImage(File image) {
    _userImageFile = image;
  }

  Future<void> _formSubmit() async {
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();

    //ignore: unnecessary_null_comparison
    if (!_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image.'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      try {
        setState(() {
          _isLoading = true;
        });
        if (_isLogin == true) {
          await AuthService()
              .signInEmailPassword(emailController.text, emailController.text);
        } else {
          await AuthService()
              .signUpEmailPassword(emailController.text, emailController.text)
              .then(
            (result) async {
              if (result != null) {
                DatabaseMethods()
                    .createImageUser(emailController.text,
                        usernameController.text, _userImageFile)
                    .then((value) => print('create image user approved'));
              }
            },
          );
        }
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeWidget(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
          ),
        );
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade900,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Text(
                      'TBL Network',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (!_isLogin) UserImagePicker(_pickedImage),
                        TextFormField(
                          key: ValueKey('email'),
                          controller: emailController,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          enableSuggestions: false,
                          validator: (value) {
                            if (value!.trim().isEmpty ||
                                !value.trim().contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            emailController.text = val!.trim();
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email address',
                          ),
                        ),
                        if (!_isLogin)
                          TextFormField(
                            key: ValueKey('username'),
                            controller: usernameController,
                            autocorrect: true,
                            textCapitalization: TextCapitalization.words,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value!.trim().isEmpty ||
                                  value.trim().length < 4) {
                                return 'Please enter at least 4 characters';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              usernameController.text = val!.trim();
                            },
                            decoration: InputDecoration(labelText: 'Username'),
                          ),
                        TextFormField(
                          key: ValueKey('password'),
                          controller: passwordController,
                          validator: (value) {
                            if (value!.trim().isEmpty ||
                                value.trim().length < 6) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            passwordController.text = val!.trim();
                          },
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        SizedBox(height: 12),
                        if (_isLoading) CircularProgressIndicator(),
                        if (!_isLoading)
                          ElevatedButton(
                            child: Text(
                              _isLogin ? 'Login' : 'Signup',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              _formSubmit();
                            },
                          ),
                        if (!_isLoading)
                          TextButton(
                            child: Text(_isLogin
                                ? 'Create new account'
                                : 'I already have an account'),
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                          )
                      ],
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
