// File: lib/data/services/designers_flutter_test_service.dart
// 2022-04-04 | CR
// Fuente: https://github.com/heyletscode/flutter-pagination-with-bloc/blob/main/lib/data/services/posts_service.dart
// Referencia: https://www.youtube.com/watch?v=ljTkGz_O36I

import 'dart:convert';
import 'package:http/http.dart';
import '/config/constants.dart';

class DesignersFlutterTestService {

  static const FETCH_LIMIT = 15;

  final endPointUrl = "users/designers_flutter_test";

  Future<Map> fetchDesignersFlutterTests(int page) async {
  // Future<List<dynamic>> fetchDesignersFlutterTests(int page) async {
    final skip = page-1;
    try {
      final response = await get(Uri.parse(Constants.baseUrl + "/" + endPointUrl + "?limit=$FETCH_LIMIT&skip=$skip"));
      // return jsonDecode(jsonDecode(response.body)['resultset']) as List<dynamic>;
      return {
        'resultset': jsonDecode(jsonDecode(response.body)['resultset']) as List<dynamic>,
        'error': false,
        'errorMessage': '',
      };
    } catch (err) {
      // return [];
      return {
        'resultset': [],
        'error': true,
        'errorMessage': err.toString(),
      };
    }
  }

}