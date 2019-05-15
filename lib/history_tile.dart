import 'package:flutter/material.dart';
import 'models/history.dart';

class HistoryTile extends StatelessWidget {
  final History _history;
  HistoryTile(this._history);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(_history.title),
          subtitle: Text(_history.des),
        )
      ],
    );
  }
}

