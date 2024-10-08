import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
        children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(12)),
        ]),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              //titre de la tâche
              Text(taskName,
              style: TextStyle(
                decoration: taskCompleted 
                 ? TextDecoration.lineThrough 
                 : TextDecoration.none
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
