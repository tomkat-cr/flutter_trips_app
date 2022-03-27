// File: lib/get_stars.dart
// 2022-03-26 | CR

import 'package:flutter/material.dart';

class getStars extends StatelessWidget {

  final double stars;
  final double size;
  final double top;
  final String fontFamily;

  getStars(
      {Key? key,
        required this.stars,
        this.size = 10.0,
        this.top = 20.0, // 323.0,
        this.fontFamily: 'Lato',
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final starColorYellow = Color(0xFFf2C611);
    final starColorGrey = Colors.grey;

    final starYellow = Icon(
      Icons.star,
      color: starColorYellow,
      size: size,
    );

    final starGrey = Icon(
      Icons.star_border,
      color: starColorGrey,
      size: size,
    );

    final starHalf = Icon(
      Icons.star_half,
      color: starColorYellow,
      size: size,
    );

    // final starYellow = Container(
    //   margin: EdgeInsets.only(
    //       top: top,
    //       right: 1.0
    //   ),
    //   child: Icon(
    //       Icons.star,
    //       color: Color(0xFFf2C611),
    //       size: size,
    //   ),
    // );
    //
    // final starGrey = Container(
    //   margin: EdgeInsets.only(
    //       top: top,
    //       right: 1.0
    //   ),
    //   child: Icon(
    //       Icons.star_border,
    //       color: Colors.grey,
    //       size: size,
    //   ),
    // );

    final starsNumber = Container(
      margin: EdgeInsets.only(
          top: top,
          right: 1.0
      ),
      child: Text(
          '$stars',
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: size,
          )
      ),
    );

    var icon = starYellow;
    var fraction = 0.00;
    var iDoubled = 0.00;
    final startList = List<Container>.filled(6, Container());
    startList[0] = starsNumber;
    for (int i=1 ; i<startList.length; i++){
      // startList[i] = (i<=stars ? starYellow : starGrey);
      // https://platzi.com/comentario/1127569/
      fraction = (stars - stars.truncate());
      iDoubled = i.toDouble() + fraction;
      if (i<=stars) {
        icon = starYellow;
      } else if (iDoubled>=stars && stars+1>i && fraction != 0) {
        icon = starHalf;
      } else {
        icon = starGrey;
      }
      startList[i] = Container(
          margin: EdgeInsets.only(
              top: top,
              right: 1.0
          ),
          child: icon
      );

    }

    return Row(
        children: startList
    );
  }
}
