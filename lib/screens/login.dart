import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginState extends State<Login> {
  TextStyle style = TextStyle(fontSize: 20.0);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
        controller: emailController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: 'Email'));

    final passwordField = TextField(
        controller: passwordController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: 'Password'));

    final loginButton = Material(
        elevation: 5.0,
        color: Color(0xff01A0C7),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
              FirebaseAuth.instance.signInWithEmailAndPassword(email:emailController.text, password: passwordController.text);
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))));

    return Scaffold(
        body: Center(
            child: Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120.0,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 15.0),
              emailField,
              SizedBox(height: 15.0),
              passwordField,
              SizedBox(
                height: 15.0,
              ),
              loginButton,
            ]),
      ),
    )));
  }
}

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}
