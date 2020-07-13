import 'package:flutter/material.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: Landing(),
        theme: ThemeData(primarySwatch: Colors.blue));
  }
}
