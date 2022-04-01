// gradient_back.dart
// 2022-03-26
// Ref: https://platzi.com/clases/1386-flutter/16331-definiendo-los-layouts-de-nuestra-interfaz/
// google: gradientback flutter
// https://jairofernandez.me/flutter/appbar/appbar-con-carousel/

import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  final String title;
  final String subtitle;

  GradientBack
    ({Key? key,
      this.title = '',
      this.subtitle = '',
    }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
              )
          ),
        ]
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}