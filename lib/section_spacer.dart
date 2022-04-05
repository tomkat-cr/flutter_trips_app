import 'package:flutter/material.dart';

class SectionSpacer extends StatelessWidget {

  final String title;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double fontSize;

  const SectionSpacer({Key? key,
    this.title = '',
    this.top = 20.0,
    this.bottom = 20.0,
    this.left = 20.0,
    this.right = 20.0,
    this.fontSize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
