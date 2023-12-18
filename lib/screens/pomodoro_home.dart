import 'dart:async';

import 'package:flutter/material.dart';

class PompdoroHomeScreen extends StatefulWidget {
  const PompdoroHomeScreen({super.key});

  @override
  State<PompdoroHomeScreen> createState() => _PompdoroHomeScreenState();
}

class _PompdoroHomeScreenState extends State<PompdoroHomeScreen> {
  static const int defaultSeconds = 1500;
  int totalSeconds = defaultSeconds;
  late Timer timer;
  bool timerFlag = false;
  int totalPomodoros = 0;

  void onChangeTotalSectonds(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        timerFlag = false;
        totalSeconds = defaultSeconds;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onPlayClick() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      onChangeTotalSectonds,
    );
    setState(() {
      timerFlag = !timerFlag;
    });
  }

  void onStopClick() {
    timer.cancel();
    setState(() {
      timerFlag = !timerFlag;
    });
  }

  String returnToDate(int seconds){
      return Duration(seconds: seconds).toString().split(".")[0].substring(2,7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                returnToDate(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                onPressed: timerFlag ? onStopClick : onPlayClick,
                iconSize: 120,
                color: Theme.of(context).cardColor,
                icon: Icon(timerFlag
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
