import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final fun;
  double fontSize;
  Color textColor;
  FontWeight fontWeight;

  DefaultTextButton({
    required this.text,
    required this.fun,
    required this.fontSize,
    this.textColor = Colors.blue,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: fun,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ));
  }
}
