import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';


class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color textColor;
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconSize,
    required this.textSize,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Kwhitecolor ,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            color: Kwhitecolor,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}