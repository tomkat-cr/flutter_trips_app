// File: lib/card_image.dart
// 2022-04-02 | CR

import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

class CardImage extends StatelessWidget {

  String pathImage = '';

  CardImage({Key? key,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, // Para que se ajuste la imagen y no se vea cortada
          image: AssetImage('assets/img/$pathImage'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
          )
        ]
      ),
    );
    // return card;
    return Stack(
      alignment: Alignment(0.9, 1.1), // Para que el boton verde aparezca debajo de la foto
      children: [
        card,
        FloatingActionButtonGreen(
          heroTag: pathImage,
        ),
      ]
    );
  }
}
