import 'package:flutter/material.dart';
import 'package:local_note_app/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //init hive
  Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('Mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}