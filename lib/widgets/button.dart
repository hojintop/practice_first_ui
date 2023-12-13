import 'package:flutter/material.dart';

class MtButton extends StatelessWidget {
  final String text;
  final Color boxColor;
  final Color fontColor;

  const MtButton({
    super.key,
    required this.boxColor,
    required this.text,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: boxColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: fontColor),
        ),
      ),
    );
  }
}
