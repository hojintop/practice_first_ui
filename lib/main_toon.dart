
import 'package:flutter/material.dart';
import 'package:practice_toonflix/screens/toon_home.dart';
import 'package:practice_toonflix/services/api_service.dart';

void main(){
  runApp(const ExampleToonApp());
}

class ExampleToonApp extends StatelessWidget {
  const ExampleToonApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToonHome(),
    );
  }
}
