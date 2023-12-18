import 'package:flutter/material.dart';

void main() {
  runApp(main2());
}

class main2 extends StatefulWidget {
  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {
  List<int> numbers = [];

  void addNumber() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
            fontSize: 60,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              W_Numbers(),
              for (var count in numbers)
                Text(
                  '$count',
                ),
              IconButton(
                onPressed: addNumber,
                icon: Icon(
                  Icons.add_box_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class W_Numbers extends StatefulWidget {
  const W_Numbers({
    super.key,
  });

  @override
  State<W_Numbers> createState() => _W_NumbersState();
}

class _W_NumbersState extends State<W_Numbers> {

  @override
  Widget build(BuildContext context) {
    return Text(
      'Numbers',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
