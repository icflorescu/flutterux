import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Pages'), automaticallyImplyLeading: false),
          ListTile(
            title: Text('Users'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Count'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/count');
            },
          ),
        ],
      ),
    );
  }
}
