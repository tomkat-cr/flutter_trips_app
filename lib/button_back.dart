import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
class ButtonBack extends StatelessWidget {

  // final BuildContext parentContext;
  ButtonBack({Key? key,
    // required this.parentContext
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        ElevatedButton(
          onPressed: () {
            // Navigator.pop(parentContext);
            // Navigator.pop(context);
            if(Navigator.canPop(context)){
              Navigator.of(context).pop();
            }else{
              // ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text('VA PARA ATRAS CON EL SystemNavigator.pop()'))
              // );
              Navigator.of(context, rootNavigator: true).pop(context);
              // SystemNavigator.pop();
            }
          },
          child: const Text('Back'),
        ),
    );
  }
}
