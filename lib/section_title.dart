import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
