import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutterux/state/app.dart';
import 'package:flutterux/pages/users.dart';
import 'package:flutterux/pages/count.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = AppState.buildStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        routes: {
          '/': (BuildContext context) => UsersPage(),
          '/count': (BuildContext context) => CountPage(),
        },
      ),
    );
  }
}
