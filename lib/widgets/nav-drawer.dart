import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
          child: Text('Side Menu',
              style: TextStyle(color: Colors.white, fontSize: 25)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/cover.jpg')))),
      ListTile(
          leading: Icon(Icons.input), title: Text('Welcome'), onTap: () => {}),
      ListTile(
          leading: Icon(Icons.verified_user),
          title: Text('Welcome'),
          onTap: () => {Navigator.of(context).pop()}),
      ListTile(
          leading: Icon(Icons.settings),
          title: Text('Welcome'),
          onTap: () => {Navigator.of(context).pop()})
    ]));
  }
}
