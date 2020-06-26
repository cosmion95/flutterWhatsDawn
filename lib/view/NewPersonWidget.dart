import 'package:flutter/material.dart';
import 'package:whats_dawn/model/Person.dart';

typedef AddFriendCallback = void Function(Person person);

class NewPersonWidget extends StatefulWidget{
  const NewPersonWidget({this.addFriend});
  final AddFriendCallback addFriend;
  @override
  State<StatefulWidget> createState() {
    return NewPersonWidgetState();
  }
}

class NewPersonWidgetState extends State<NewPersonWidget>{

final TextEditingController nameController = TextEditingController();
final TextEditingController aliasController = TextEditingController();
final TextEditingController idController = TextEditingController();

final FocusNode focusName = FocusNode();
final FocusNode focusAlias = FocusNode();
final FocusNode focusId = FocusNode();

@override
void dispose(){
  nameController.dispose();
  aliasController.dispose();
  idController.dispose();

  focusName.dispose();
  focusAlias.dispose();
  focusId.dispose();
  super.dispose();
}

@override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Row(
      children: <Widget>[
        Expanded(
          child: TextField(
          controller: nameController,
          focusNode: focusName,
          decoration: InputDecoration(
            labelText: "Name",
            isDense: true,
            contentPadding: EdgeInsets.all(0)
          ),
          onEditingComplete: () {
            focusAlias.requestFocus();
          },
        )),
        Expanded(
          child: TextField(
          controller: aliasController,
          focusNode: focusAlias,
          decoration: InputDecoration(
            labelText: "Alias",
            isDense: true,
            contentPadding: EdgeInsets.all(0)
          ),
          onEditingComplete: () {
            focusId.requestFocus();
          },
        )),
        Expanded(
          child: TextField(
          controller: idController,
          focusNode: focusId,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "ID",
            isDense: true,
            contentPadding: EdgeInsets.all(0)
          ),
          onEditingComplete: () {
            focusId.unfocus();
          },
        ))
      ],
    ),
    RaisedButton(onPressed: () {
            widget.addFriend(new Person(nameController.text, aliasController.text, int.parse(idController.text)));
          },
          child: Text("ADD"),)
    ]
    );
  }

}