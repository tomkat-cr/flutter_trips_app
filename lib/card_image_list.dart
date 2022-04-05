// File: lib/card_image_list.dart
// 2022-04-02 | CR

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/card_image.dart';

class CardImageList extends StatelessWidget {

  List headerImagesList;
  // double top;
  double height;
  double padding;

  CardImageList({Key? key,
    // this.top = 270.0,
    this.height = 350.0,
    this.padding = 25.0,
    required this.headerImagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final growableList = <Widget>[];

    headerImagesList.forEach((e){
      growableList.add(
        CardImage(
          pathImage: e['pathImage'],
        ),
      );
    });

    return Container(
      height: height,
      child: ListView(
        padding: EdgeInsets.all(padding),
        scrollDirection: Axis.horizontal,
        children: growableList
      ),
    );
  }
}
