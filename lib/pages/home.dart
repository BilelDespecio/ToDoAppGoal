import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_note_app/data/database.dart';
import 'package:local_note_app/util/show_dialog.dart';
import 'package:local_note_app/util/todo_til.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    //si la first ouverture de l'app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }else{
      //les données existe déja 
      db.loadData();
    }

    super.initState();
  }

  //controller du champ de saisie
  final _controller = TextEditingController();

  //Clique du checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updatedatabase;
  }

  // ajout nouvelle tâche
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase;
  }

  //Créaction de nouvelle tâche
  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          );
      }
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.remove(index);
    });
    db.updatedatabase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context ) => deleteTask,
          );
        },
      ),
    );
  }
}
