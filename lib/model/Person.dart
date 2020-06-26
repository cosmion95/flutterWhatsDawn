class Person{
  Person(this._nume, this._alias, this._id);
  String _nume;
  String _alias;
  int _id;

  String getAlias(){
    return _alias;
  }
  String getName(){
    return _nume;
  }
  int getId(){
    return _id;
  }
  String getInitial(){
    return _nume.substring(0, 1);
  }
}