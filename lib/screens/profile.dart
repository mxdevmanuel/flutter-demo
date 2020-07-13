import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Profile> fetchProfile() async {
  final response = await http.get('https://randomuser.me/api/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Profile.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Profile {
  final String userId;
  final String email;
  final String name;
  final String picture;

  Profile({this.userId, this.name, this.email, this.picture});

  factory Profile.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> results = json['results'][0];
    return Profile(
        userId: results['id']['value'],
        name: results['name']['first'],
        email: results['email'],
        picture: results['picture']['large']);
  }
}

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<UserProfile> {
  Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Profile>(
            future: futureProfile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.all(0.0),
                  color: Colors.cyan[600],
                  width: 300.0,
                  height: 300.0,
                  child: Column(children: <Widget>[
                    Text(snapshot.data.userId),
                    Image.network(snapshot.data.picture),
                    Text(snapshot.data.name),
                    Text(snapshot.data.email),
                  ]),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
