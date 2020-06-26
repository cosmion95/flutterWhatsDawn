import "package:flutter/material.dart";
import 'package:whats_dawn/model/MaterialColorsArray.dart';
import 'package:whats_dawn/model/PersonMessages.dart';
import 'package:whats_dawn/view/MessagesWidget.dart';
import 'package:intl/intl.dart';

class ListPersonWidget extends StatefulWidget {
  ListPersonWidget(this.personMessages);
  final PersonMessages personMessages;

  @override
  State<StatefulWidget> createState() {
    return ListPersonWidgetState();
  }
}

class ListPersonWidgetState extends State<ListPersonWidget> {
  String getInitial() {
    return widget.personMessages.getPerson().getName().substring(0, 1);
  }

  String formatDate() {
    var format = DateFormat("dd/MM/yy");
    return format.format(widget.personMessages.getLastDate()).toString();
  }

  bool hasNewMessages() {
    return widget.personMessages.getNewMessages() > 0 ? true : false;
  }

  Color lastDateColor() {
    return widget.personMessages.getNewMessages() > 0
        ? Color(0xff33b89d)
        : Color(0xffffffff).withOpacity(0.5);
  }

  void tapInitial() {
    print("tapped initial for " + widget.personMessages.getPerson().getName());
  }

  void tapName() {
    print("tapped name for " + widget.personMessages.getPerson().getName());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MessagesWidget(widget.personMessages.getPerson())));
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                tapInitial();
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(MaterialColorsArray.getRandom()),
                    child: Text(
                      getInitial(),
                      style: TextStyle(color: Color(0xffffffff), fontSize: 20),
                    ),
                  ))),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    tapName();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xffffffff).withOpacity(0.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 15),
                                child: Text(
                                    widget.personMessages.getPerson().getName(),
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.personMessages.getLastMessage(),
                              style: TextStyle(
                                  color: Color(0xffffffff).withOpacity(0.5),
                                  fontSize: 8),
                            ))
                      ],
                    ),
                  ))),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 7),
            child: Column(children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(formatDate(),
                        style: TextStyle(color: lastDateColor(), fontSize: 8))),
              ),
              Visibility(
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  visible: hasNewMessages(),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff33b89d),
                      child: Text(
                        widget.personMessages.getNewMessages().toString(),
                        style: TextStyle(color: Color(0xffffffff), fontSize: 8),
                      ),
                      radius: 8,
                    ),
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
