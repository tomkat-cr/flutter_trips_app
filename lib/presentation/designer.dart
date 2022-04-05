// File: lib/designer.dart
// 2022-04-04 | CR

import 'package:flutter/material.dart';

class Designer extends StatelessWidget {

  String pathImage;
  String name;
  double experience;
  String email;

  Designer({Key? key,
    required this.pathImage,
    required this.name,
    required this.email,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 10.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final userDetails = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 10.0
      ),
      child: Text(
        'Experience: ' + experience.toString() + ' Year(s)',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 17.0,
            color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final emailBubble = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          // left: 10.0,
          // right: 10.0,
      ),
      width: 55.0,
      height: 55.0,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Email $email'))
          );
        },
        child: Icon(
          Icons.mail,
          color: (email == '' ? Colors.black54 : Colors.white),
          size: 35.0,
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          // fixedSize: Size(30.0, 40.0),
          // padding: EdgeInsets.all(10),
          primary: (email == '' ? Colors.grey : Colors.red), // <-- Button color
          onPrimary: Colors.redAccent, // <-- Splash color
        ),
      ),
    );

    final userInfo = Row(
      children: <Widget>[
        userDetails,
      ],
    );

    final userDetailsCombo = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userName,
          userInfo,
        ]
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 10.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/$pathImage'),
          )
      ),
    );

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: photo, flex: 2),
            Expanded(child: userDetailsCombo, flex: 6),
            Expanded(child: emailBubble, flex: 2),
          ],
        ),
        Divider(),
      ],
    );
  }
}
