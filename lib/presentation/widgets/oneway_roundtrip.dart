import 'package:flutter/material.dart';

class OneWayRoundTrip extends StatelessWidget {
  const OneWayRoundTrip(
      {Key? key,
      this.condition,
      required this.onClick,
      this.bottomLeft = 0,
      this.topLeft = 0,
      this.bottomRight = 0,
      this.topRight = 0,
      required this.wayOrRound})
      : super(key: key);
  final Function() onClick;
  final condition;
  final double bottomLeft;
  final double topLeft;
  final double bottomRight;
  final double topRight;
  final String wayOrRound;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: condition ? Colors.deepOrangeAccent : Colors.indigoAccent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeft),
            topLeft: Radius.circular(topLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight),
          ),
        ),
        child:  Text(
          wayOrRound,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
