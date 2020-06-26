import 'package:flutter/material.dart';
import 'package:whats_dawn/model/Person.dart';

class MessagesWidget extends StatefulWidget {
  MessagesWidget(this._person);
  final Person _person;

  Person getPerson() {
    return _person;
  }

  @override
  State<StatefulWidget> createState() {
    return MessagesWidgetState();
  }
}

class MessagesWidgetState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              child: Text(widget._person.getInitial()),
            ),
            Column(
              children: <Widget>[
                Text(widget._person.getName()),
                Text("last seen yesterday at 7:20")
              ],
            ),
          ],
        ),
      ),
      body: Container(
      color: Color(0xffffffff),
      child: Column(
      children: <Widget>[
      Container(
        child: Text(
          widget.getPerson().getName(),
          style: TextStyle(fontSize: 20, color: Color(0xff000000)),
        ),
      ),
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("back"),
      )
    ])));
  }
}
