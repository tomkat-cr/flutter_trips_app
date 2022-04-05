// File: lib/description_place.dart
// 2022-03-26 | CR

import 'package:flutter/material.dart';
import 'get_stars.dart';
import 'button_purple.dart';

class DescriptionPlace extends StatelessWidget {

  final String description;
  final double stars;
  final String longDescription;
  final double top;

  DescriptionPlace(
      {Key? key,
        required this.description,
        required this.longDescription,
        required this.stars,
        this.top = 20.0, // 320.0 inicialmente
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final startList = getStars(
        stars: stars,
        size: 20,
        top: top,
    );

    final description = Container(
        margin: EdgeInsets.only(
            top: top,
            left: 20.0,
            right: 20.0
        ),
        child: Text(
          this.description,
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,
        )
    );

    final titleStars = Row(
      children: <Widget>[
        description,
        startList,
      ],
    );

    final longDescBox = Container(
        margin: EdgeInsets.only(
            top: 5.0,
            left: 20.0,
            right: 20.0
        ),
        child: SizedBox(
          // width: 300,
          child: Text(
            this.longDescription,
            style: TextStyle(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
    );

    final response = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        longDescBox,
        ButtonPurple(
          buttonText: 'Navigate',
        ),
      ]
    );

    return response;
  }
}
