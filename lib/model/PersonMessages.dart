import 'package:whats_dawn/model/Person.dart';
import 'package:whats_dawn/model/Message.dart';

class PersonMessages {

  PersonMessages(this._person, this._lastMessage, this._lastDate, this._newMessages);

  Person _person;
  String _lastMessage;
  DateTime _lastDate;
  int _newMessages;
  List<Message> _messageList;

  Person getPerson(){
    return _person;
  }
  String getLastMessage(){
    return _lastMessage;
  }
  DateTime getLastDate(){
    return _lastDate;
  }
  int getNewMessages(){
    return _newMessages;
  }
  List<Message> getMessagesList(){
    return _messageList;
  }
}