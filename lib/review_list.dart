// File: lib/review_list.dart
// 2022-03-26 | CR

import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {

  List reviewList;

  ReviewList({Key? key,
    required this.reviewList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final growableList = <Widget>[];

      reviewList.forEach((e){
        growableList.add(
          Review(
            pathImage: e['pathImage'],
            name: e['name'],
            // details: e['details'],
            comment: e['comment'],
            stars: e['stars'],
            reviewsQty: (e['reviewsQty'] == null ? 0 : e['reviewsQty']),
            photosQty: (e['photosQty'] == null ? 0 : e['photosQty']),
          ),
        );
      });

    return Column(
      children: growableList,
    );
  }
}
