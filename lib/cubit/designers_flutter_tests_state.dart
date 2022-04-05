// File:  lib/cubit/designers_flutter_tests_state.dart
// 2022-04-04 | CR

part of 'designers_flutter_tests_cubit.dart';

@immutable
abstract class DesignersFlutterTestsState {}

class DesignersFlutterTestsInitial extends DesignersFlutterTestsState {}
class DesignersFlutterTestsLoaded extends DesignersFlutterTestsState {
  final List<DesignersFlutterTest> designersFlutterTests;

  DesignersFlutterTestsLoaded(this.designersFlutterTests);
}

class DesignersFlutterTestsLoading extends DesignersFlutterTestsState {
  final List<DesignersFlutterTest> oldDesignersFlutterTests;
  final bool isFirstFetch;

  DesignersFlutterTestsLoading(this.oldDesignersFlutterTests, {this.isFirstFetch=false});
}
