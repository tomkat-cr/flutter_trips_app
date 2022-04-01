// File: lib/main.dart
// 2021-06-25 | CR

import 'package:flutter/material.dart';
import 'gradient_back.dart';
import 'description_place.dart';
import 'review_list.dart';
import 'section_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 123',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {

  late AnimationController controller;
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final dummyText = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, ad aliquam animi beatae blanditiis commodi cumque dignissimos dolorem ea est expedita fugit impedit incidunt ipsa laudantium mollitia natus nesciunt officia officiis provident quas qui quibusdam quo reiciendis repudiandae, similique velit vitae! Distinctio eum magnam molestias vero. Autem minus nam sapiente!';
    final commentText = 'This text is very very very very very very very very very very very very very very very very very very very very very very very very very long';
    // final detailText = '1 review - 5 photos';

    final reviewList = <Map>[
      {
        'pathImage': 'Carlos.Ramirez.Arabe.jpg',
        'name': 'Carlos Ramirez Arabe',
        'stars': 1.5,
        // 'details': detailText,
        'comment': commentText,
        'reviewsQty': 1,
        'photosQty': 1,
      },
      {
        'pathImage': 'Carlos.Ramirez.Cycling.jpg',
        'name': 'Carlos J. Ramirez Cycling',
        'stars': 2.0,
        // 'details': detailText,
        'comment': commentText,
      },
      {
        'pathImage': 'Carlos.Ramirez.Lleras.jpg',
        'name': 'Carlos R. Parque Lleras',
        'stars': 3.0,
        // 'details': detailText,
        'comment': commentText,
      },
    ];

    return Scaffold(
      // appBar: this.getAppBar(),

      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.

      body:Stack(
          children: <Widget>[
            ListView(
                children: <Widget>[

                  DescriptionPlace(
                    description: 'Carlitos Yes',
                    longDescription: dummyText,
                    stars: _counter.toDouble(),
                    top: 220.0,
                  ),

                  SectionTitle(title: 'All reviews'),

                  ReviewList(reviewList: reviewList),

                ]

            ),

            GradientBack(
              // title: 'Bienvenido',
              // subtitle: "No lo puedo creer... mi 1er app ever!",
            ),

          ]
      )



      // body:ListView(
      //   children: <Widget>[
      //     Column(
      //       // Column is also a layout widget. It takes a list of children and
      //       // arranges them vertically. By default, it sizes itself to fit its
      //       // children horizontally, and tries to be as tall as its parent.
      //       //
      //       // Invoke "debug painting" (press "p" in the console, choose the
      //       // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //       // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //       // to see the wireframe for each widget.
      //       //
      //       // Column has various properties to control how it sizes itself and
      //       // how it positions its children. Here we use mainAxisAlignment to
      //       // center the children vertically; the main axis here is the vertical
      //       // axis because Columns are vertical (the cross axis would be
      //       // horizontal).
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //
      //         GradientBack(
      //           // title: 'Bienvenido',
      //           // subtitle: "No lo puedo creer... mi 1er app ever!",
      //         ),
      //
      //         DescriptionPlace(
      //           description: 'Carlitos Yes',
      //           // longDescription: 'This text is very very very very very very very very very very very very very very very very very very very very very very very very very long',
      //           longDescription: dummyText,
      //           stars: _counter.toDouble(),
      //         ),
      //
      //         SectionTitle(title: 'All reviews'),
      //
      //         ReviewList(reviewList: reviewList),
      //
      //         Container(
      //           margin: EdgeInsets.only(
      //             top: 40.0,
      //             left: 20.0,
      //           ),
      //           alignment: Alignment.topLeft,
      //           child: Divider(),
      //         ),
      //
      //         Text(
      //           'You have pushed the button this many times:',
      //         ),
      //         Text(
      //           '$_counter',
      //           style: Theme.of(context).textTheme.headline4,
      //         ),
      //
      //         Container(
      //           margin: EdgeInsets.only(
      //             top: 40.0,
      //             left: 20.0,
      //             bottom: 40.0,
      //           ),
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             '',
      //             textAlign: TextAlign.left,
      //             style: TextStyle(
      //               fontSize: 18.0,
      //             ),
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ],
      // ),
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      //
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
    // _DescriptionPlaceState._setEstrellas(_counter);
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  AppBar getAppBar() {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(widget.title),

      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.remove),
          tooltip: 'Show Snackbar',
          onPressed: _decrementCounter,
        ),
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          // height: 50,
                          // color: Colors.amber[600],
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://www.mediabros.com/wp-content/uploads/2016/05/Mediabros.Planes.de_.Mantenimiento.de_.Contenido.640.jpg',
                                    loadingBuilder: (context, child, progress) {
                                      return progress == null
                                          ? child
                                          : LinearProgressIndicator(
                                        value: controller.value,
                                        semanticsLabel: 'Linear progress indicator',
                                      );
                                    },
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  Image.network(
                                    'https://www.mediabros.com/wp-content/uploads/2017/08/Planes.de_.Mantenimiento.050.Mediabros.png',
                                    loadingBuilder: (context, child, progress) {
                                      return progress == null
                                          ? child
                                          : LinearProgressIndicator(backgroundColor: Colors.black);
                                    },
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  Image.network(
                                    'https://www.mediabros.com/wp-content/uploads/2016/05/Mediabros.Prd_.Contratos.Mantenimiento.Sitio_.Web_.OLX_.1024.png',
                                  ),
                                  // Text(
                                  //   '',
                                  //   style: TextStyle(fontSize: 8),
                                  // ),

                                  Divider(),

                                  Text(
                                    'This is the next page, text # 1',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'This is the next page, text # 2',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(fontSize: 48),
                                  ),
                                ]
                            ),
                          ),

                        ),
                      ],
                    )

                );
              },
            ));
          },
        ),
      ],


    );
  }

}
