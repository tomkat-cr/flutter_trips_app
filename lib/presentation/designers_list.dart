// File: lib/presentation/designers_list.dart
// 2022-04-04 | CR

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/button_back.dart';
import '/data/services/designers_flutter_test_service.dart';
import '/data/repositories/designers_flutter_tests_repository.dart';
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
    repository.fetchDesignersFlutterTestsWithError(page)
    .then((newDesignersFlutterTests) {
      setState(() {
        _designersJson = newDesignersFlutterTests['resultset'];
        _error = newDesignersFlutterTests['error'];
        _errorMessage = newDesignersFlutterTests['errorMessage'];
      });
    })
    .catchError((e) {
      setState(() {
        _designersJson = [];
        _error = true;
        _errorMessage = 'Got error: $e';
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
      // Se elimino porque al dar error la llamada al backend, aca se genera otro error
      // que se transforma en Exception...
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Error: $_errorMessage'))
      // );
      return Column(
        children: <Widget>[
          // ButtonBack(parentContext: context),
          ButtonBack(),
          Text(
            'Error en conexión a los servicios del App [BE-010]'
          ),
          Text(
              'Detalle del Error:'
          ),
          Text(
              _errorMessage
          ),
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

    return
      SingleChildScrollView(
        child:
        Column(
          children: [
            ButtonBack(),
            Column(
                children: growableList,
            ),
          ],
        ),
    );

  }
}
