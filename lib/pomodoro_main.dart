import 'package:flutter/material.dart';
import 'package:practice_toonflix/screens/pomodoro_home.dart';

void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xffe7626c),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xff232b55),
          ),
        ),
        cardColor: Color(0xfff4eddb),
      ),
      home: PompdoroHomeScreen(),
    );
  }
}
