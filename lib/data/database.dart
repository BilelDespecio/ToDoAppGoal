import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference de notre box
  final _myBox = Hive.box('mybox');

  //run this method if this is the &st time opening this app
  void createInitialData(){
    toDoList = [
      ["Modification password", false],
      ["Publication post", false]
    ];
  }

  //LOAD THE DATA FROM DATABASE
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //UPDATE THE DATABASE
  void updatedatabase(){
    _myBox.put("TODOLIST", toDoList);
  }

}