// file: lib/presentation/designers_flutter_tests_screen.dart
// 2022-04-04 | CR

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/designers_flutter_tests_cubit.dart';
import '/data/models/designers_flutter_test.dart';

class DesignersFlutterTestsView extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<DesignersFlutterTestsCubit>(context).loadDesignersFlutterTests();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<DesignersFlutterTestsCubit>(context).loadDesignersFlutterTests();

    return Scaffold(
      appBar: AppBar(
        title: Text("Designers Flutter Tests"),
      ),
      body: _designersFlutterTestList(),
    );
  }

  Widget _designersFlutterTestList() {
    return BlocBuilder<DesignersFlutterTestsCubit, DesignersFlutterTestsState>(builder: (context, state) {
      if (state is DesignersFlutterTestsLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<DesignersFlutterTest> designersFlutterTests = [];
      bool isLoading = false;

      if (state is DesignersFlutterTestsLoading) {
        designersFlutterTests = state.oldDesignersFlutterTests;
        isLoading = true;
      } else if (state is DesignersFlutterTestsLoaded) {
        designersFlutterTests = state.designersFlutterTests;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < designersFlutterTests.length)
            return _designersFlutterTest(designersFlutterTests[index], context);
          else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: designersFlutterTests.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _designersFlutterTest(DesignersFlutterTest designersFlutterTest, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${designersFlutterTest.id}. ${designersFlutterTest.name}",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(designersFlutterTest.experience.toString() + ' Year(s)'),
          Text(designersFlutterTest.email),
        ],
      ),
    );
  }
}