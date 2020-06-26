import 'package:whats_dawn/model/Person.dart';

class Message {
  Message(this._id, this._msg, this._date, this._person, this._type, this._read);
  int _id;
  String _msg;
  DateTime _date;
  Person _person;
  int _type;
  bool _read;

  int getId(){
    return _id;
  }
  String getMsg(){
    return _msg;
  }
  DateTime getDate(){
    return _date;
  }
  Person getPerson(){
    return _person;
  }
  int getType(){
    return _type;
  }
  bool getRead(){
    return _read;
  }
}