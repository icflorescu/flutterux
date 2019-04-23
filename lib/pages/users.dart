import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:faker/faker.dart';

import 'package:flutterux/state/app.dart';
import 'package:flutterux/state/user.dart';
import 'package:flutterux/widgets/app_drawer.dart';

class _ViewModel {
  final Store<AppState> _store;
  _ViewModel(this._store);
  final Faker faker = Faker();

  List<User> get users => _store.state.users;

  void addUser() {
    _store.dispatch(AddUserAction(User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      company: faker.company.name(),
      job: faker.job.title(),
    )));
  }
}

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel(store),
      builder: (BuildContext context, _ViewModel model) {
        return Scaffold(
          appBar: AppBar(title: Text('Users')),
          drawer: AppDrawer(),
          body: ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              User user = model.users[index];
              return Column(children: <Widget>[
                index == 0 ? Container() : Divider(),
                ListTile(
                    title: Text(user.name),
                    subtitle: Text('${user.job} @ ${user.company}'))
              ]);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.addUser,
            tooltip: 'Add user',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
