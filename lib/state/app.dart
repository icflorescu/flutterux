import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:flutterux/state/user.dart';
import 'package:flutterux/state/count.dart';

class AppState {
  final int count;
  final List<User> users;

  AppState({@required this.count, @required this.users});

  static buildStore() => Store<AppState>(
        (AppState state, action) => AppState(
              count: countReducer(state.count, action),
              users: userReducer(state.users, action),
            ),
        initialState: AppState(count: 0, users: List.unmodifiable(<User>[])),
      );
}
