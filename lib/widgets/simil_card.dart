import "package:flutter/material.dart";

class Simil_card extends StatelessWidget {
  final String sidType, price, moneyType;
  final Icon sidIcon;
  final Color bgColor, fontColor;
  final double cardOffsetY;

  const Simil_card({
    super.key,
    required this.sidType,
    required this.price,
    required this.moneyType,
    required this.sidIcon,
    required this.bgColor,
    required this.fontColor,
    required this.cardOffsetY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0,-cardOffsetY*10),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sidType,
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        moneyType,
                        style: TextStyle(
                          color: fontColor.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.1,
                child: Transform.translate(
                  offset: Offset(-5, 10),
                  child: sidIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
