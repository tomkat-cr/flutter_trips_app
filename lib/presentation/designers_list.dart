// File: lib/presentation/designers_list.dart
// 2022-04-04 | CR

import 'package:flutter/material.dart';

import '/data/services/designers_flutter_test_service.dart';
import '/data/repositories/designers_flutter_tests_repository.dart';
// import '/data/models/designers_flutter_test.dart';
import 'designer.dart';

class DesignersList extends StatefulWidget {
  const DesignersList({Key? key}) : super(key: key);
  @override
  State<DesignersList> createState() => _DesignersListState();
}

class _DesignersListState extends State<DesignersList> {

  bool _error = false;
  String _errorMessage = '';
  List<dynamic> _designersJson = [];
  int page = 1;
  final DesignersFlutterTestsRepository repository =
    DesignersFlutterTestsRepository(DesignersFlutterTestService());

  void fetchDesigners() async {
    repository.fetchDesignersFlutterTestsWithError(page).then((newDesignersFlutterTests) {
      setState(() {
        _designersJson = newDesignersFlutterTests['resultset'];
        _error = newDesignersFlutterTests['error'];
        _errorMessage = newDesignersFlutterTests['errorMessage'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDesigners();
  }

  @override
  Widget build(BuildContext context) {
    final growableList = <Widget>[];

    if (_error == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $_errorMessage'))
      );
      return Column(
        children: <Widget>[
          Text(
            'Error: ' + _errorMessage
          )
        ],
      );
    }

    _designersJson.forEach((e){
      growableList.add(
        Designer(
          pathImage: e.pathImage,
          name: e.name,
          email: e.email,
          experience: e.experience,
        ),
      );
    });

    return Column(
      children: growableList,
    );

  }
}
