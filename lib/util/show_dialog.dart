import 'package:flutter/material.dart';
import 'package:local_note_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //champ de saisie
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ajouter une nouvelle tâche"),
            ),

            //button de validation et de retour
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save bouton
                MyButton(
                  onPressed: () {},
                  text: 'Ajouter',
                ),
                //retour bouton
                MyButton(
                  onPressed: () {},
                  text: 'Quitter',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
