import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String company;
  final String job;

  User({@required this.id, @required this.name, this.company, this.job});
}

class AddUserAction {
  final User user;
  AddUserAction(this.user);
}

class RemoveUserAction {
  final String id;
  RemoveUserAction(this.id);
}

List<User> userReducer(List<User> users, action) {
  if (action is AddUserAction) {
    return []
      ..addAll(users)
      ..add(action.user);
  }
  if (action is RemoveUserAction) {
    return []
      ..addAll(users)
      ..removeWhere((user) => user.id == action.id);
  }
  return users;
}
