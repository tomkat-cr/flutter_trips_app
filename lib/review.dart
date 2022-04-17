// File: lib/review.dart
// 2022-03-26 | CR

import 'package:flutter/material.dart';
import 'get_stars.dart';

class Review extends StatelessWidget {

  String pathImage;
  String name;
  // String details;
  double stars;
  String comment;
  int reviewsQty;
  int photosQty;

  Review({Key? key,
      required this.pathImage,
      required this.name,
      // required this.details,
      required this.stars,
      required this.comment,
      this.reviewsQty = 0,
      this.photosQty = 0,
  }) : super(key: key);

@override
  Widget build(BuildContext context) {

  final detailTextReviews = (reviewsQty == 1 ? '$reviewsQty review' : '$reviewsQty reviews');
  final detailTextPhotos = (photosQty == 1 ? '$photosQty photo' : '$photosQty photos');

  final userName = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 17.0,
        ),
      ),
    );

    final userDetails = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0
      ),
      child: Text(
        // details,
        '$detailTextReviews - $detailTextPhotos',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 15.0,
          color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final startList = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 10.0
      ),
      child: GetStars(
        stars: stars,
        size: 15,
        top: 0.0,
      ),
    );

    final userInfo = Row(
        children: <Widget>[
          userDetails,
          startList,
        ],
    );

    final userComment = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0
      ),
      child: SizedBox(
        width: 250,
        child: Text(
          comment,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );

    final userDetailsCombo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment,
      ]
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img/$pathImage'),
        )
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetailsCombo,
      ],
    );
  }
}
