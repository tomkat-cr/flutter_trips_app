// File: lib/data/repositories/designers_flutter_tests_repository.dart
// 2022-04-04 | CR

import '/data/models/designers_flutter_test.dart';
import '/data/services/designers_flutter_test_service.dart';

class DesignersFlutterTestsRepository {

  final DesignersFlutterTestService service;

  DesignersFlutterTestsRepository(this.service);

  Future<List<DesignersFlutterTest>> fetchDesignersFlutterTests(int page) async {
    final DesignersFlutterTests = await service.fetchDesignersFlutterTests(page);
    return DesignersFlutterTests['resultset'].map((e) => DesignersFlutterTest.fromJson(e)).toList();
  }

  Future<Map> fetchDesignersFlutterTestsWithError(int page) async {
    final designersFlutterTests = await service.fetchDesignersFlutterTests(page);
    return {
      'error': designersFlutterTests['error'] as bool,
      'errorMessage': designersFlutterTests['errorMessage'] as String,
      'resultset': designersFlutterTests['resultset']
          .map((e) => DesignersFlutterTest.fromJson(e))
          .toList() as List<dynamic>,
    };
  }

}