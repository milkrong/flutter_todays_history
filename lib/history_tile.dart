import 'package:flutter/material.dart';
import 'models/history.dart';

class HistoryTile extends StatelessWidget {
  final History _history;
  HistoryTile(this._history);

  @override
  Widget build(BuildContext context) {
    String picUrl = _history.pic.length > 0 ? _history.pic : "https://via.placeholder.com/50";
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
              _history.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0
              ),
          ),
          subtitle: Text(
              _history.des,
            style: TextStyle(
              fontSize: 18.0
            ),
          ),
          leading: Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Image.network(
                picUrl,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.fill
            ),
          ),
        )
      ],
    );
  }
}

