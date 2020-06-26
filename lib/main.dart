import 'package:flutter/material.dart';
import 'package:whats_dawn/model/Person.dart';
import 'package:whats_dawn/view/ListPersonWidget.dart';
import 'package:whats_dawn/view/NewPersonWidget.dart';
import 'package:whats_dawn/model/PersonMessages.dart';
import 'package:whats_dawn/view/MessagesWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsDawn',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'WhatsDawn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonMessages> friends = [
    PersonMessages(
        Person("Cosmin", "Grasu", 1), "salut, ce faci?", DateTime.now(), 3),
    PersonMessages(
        Person("Nicoleta", "Cota", 1), "helloooooooou", DateTime.now(), 0),
    PersonMessages(Person("Alin", "Gobi", 1), "gg", DateTime.now(), 1)
  ];

  final TextEditingController newPersonController = TextEditingController();

  void addFriend(Person person) {
    setState(() {
      //friends.add(person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return ListPersonWidget(friends[counter]);
              },
              itemCount: friends.length,
            ),
          ),
          NewPersonWidget(addFriend: (Person person) {
            addFriend(person);
          })
        ],
      ),
      backgroundColor: Color(0xff1d2933),
    );
  }
}
