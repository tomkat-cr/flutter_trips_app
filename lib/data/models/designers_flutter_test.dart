// file: lib/data/models/designers_flutter_test.dart
// 2022-04-04 | CR

import 'package:objectid/objectid.dart';

class DesignersFlutterTest {
  final String pathImage;
  final String name;
  final String email;
  final double experience;
  final double stars;
  final String comments;
  final int reviewsQty;
  final int photosQty;
  final String id;

  DesignersFlutterTest.fromJson(Map json) :
        pathImage = json['pathImage'],
        name = json['name'],
        experience = json['experience'],
        email = (json['email'] == null ? '' : json['email']),
        stars = (json['stars'] == null ? 0.0 : json['stars']),
        comments = (json['comments'] == null ? '' : json['comments'][0]),
        reviewsQty = (json['reviewsQty'] == null ? 0 : json['reviewsQty']),
        photosQty = (json['photosQty'] == null ? 0 : json['photosQty']),
        id = ObjectId.fromHexString(json['_id']['\$oid']).toString();
}