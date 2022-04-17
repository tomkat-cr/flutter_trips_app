// File: lib/button_purple.dart
// 2022-04-02 | CR

import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {

  String buttonText;
  Widget? onTapWidget;

  ButtonPurple({Key? key,
    required this.buttonText,
    this.onTapWidget = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // https://api.flutter.dev/flutter/material/InkWell-class.html
    // A rectangular area of a Material that responds to touch.
    return InkWell(
      onTap: () {
        if(onTapWidget != null) {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                // appBar: AppBar(
                //   title: const Text('Designers'),
                // ),
                body: onTapWidget,
              );
            },
          ));
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          // right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1),
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
      child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
