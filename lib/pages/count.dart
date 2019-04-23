import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterux/state/app.dart';
import 'package:flutterux/state/count.dart';
import 'package:flutterux/widgets/app_drawer.dart';

class _ViewModel {
  final Store<AppState> _store;
  _ViewModel(this._store);
  int get count => _store.state.count;
  void incrementCount() => _store.dispatch(IncrementCountAction());
}

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel(store),
      builder: (BuildContext context, _ViewModel model) {
        return Scaffold(
          appBar: AppBar(title: Text('Counter')),
          drawer: AppDrawer(),
          body: Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                model.count.toString(),
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 128,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.incrementCount();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
