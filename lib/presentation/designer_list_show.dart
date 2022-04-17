import 'package:flutter/material.dart';
import 'designers_appbar.dart';
import 'designers_list.dart';

class DesignerListShow extends StatelessWidget {
  const DesignerListShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: const EdgeInsets.only(
              top: 120.0,
              left: 8.00
          ),
          children: <Widget>[
            DesignersList(),
          ],
        ),
        DesignersAppBar(),
      ],
    );
  }
}
