// File: lib/header_appbar.dart
// 2022-04-02 | CR

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/card_image_list.dart';

import 'gradient_back.dart';

class HeaderAppBar extends StatelessWidget {

  String title;
  String subtitle;
  List headerImagesList;
  double top;
  double height;
  double padding;

  HeaderAppBar({Key? key,
    this.title = '',
    this.subtitle = '',
    this.top = 350.0,
    this.height = 350.0,
    this.padding = 25.0,
    required this.headerImagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(
          title: title,
          subtitle: subtitle, // "No lo puedo creer... mi 1er app ever!",
        ),
        CardImageList(
          headerImagesList: headerImagesList,
          // top: top
          height: height,
          padding: padding,
        ),
      ],
    );
  }
}
