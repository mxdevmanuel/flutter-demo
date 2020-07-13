import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/randomwords.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user == null) {
              return Login();
            }
            return RandomWords();
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
