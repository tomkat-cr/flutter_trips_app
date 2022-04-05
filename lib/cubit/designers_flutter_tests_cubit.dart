// File: lib/cubit/designers_flutter_tests_cubit.dart
// 2022-04-04 | CR

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/data/models/designers_flutter_test.dart';
import '/data/repositories/designers_flutter_tests_repository.dart';

part 'designers_flutter_tests_state.dart';

class DesignersFlutterTestsCubit extends Cubit<DesignersFlutterTestsState> {
  DesignersFlutterTestsCubit(this.repository) : super(DesignersFlutterTestsInitial());

  int page = 1;
  final DesignersFlutterTestsRepository repository;

  void loadDesignersFlutterTests() {
    if (state is DesignersFlutterTestsLoading) return;

    final currentState = state;

    var oldDesignersFlutterTests = <DesignersFlutterTest>[];
    if (currentState is DesignersFlutterTestsLoaded) {
      oldDesignersFlutterTests = currentState.designersFlutterTests;
    }

    emit(DesignersFlutterTestsLoading(oldDesignersFlutterTests, isFirstFetch: page == 1));

    repository.fetchDesignersFlutterTests(page).then((newDesignersFlutterTests) {
      page++;

      final designersFlutterTests = (state as DesignersFlutterTestsLoading).oldDesignersFlutterTests;
      designersFlutterTests.addAll(newDesignersFlutterTests);

      emit(DesignersFlutterTestsLoaded(designersFlutterTests));
    });
  }

}