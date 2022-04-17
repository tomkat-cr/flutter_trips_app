// File: lib/main.dart
// 2021-06-25 | CR

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/header_appbar.dart';
// import 'package:platzi_trips_app/presentation/designers_list.dart';
// import 'gradient_back.dart';
import 'description_place.dart';
import 'review_list.dart';
import 'section_title.dart';
import 'section_spacer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/designers_flutter_tests_cubit.dart';
import '/data/repositories/designers_flutter_tests_repository.dart';
// import '/data/services/designers_flutter_test_service.dart';
import '/presentation/designers_flutter_tests_screen.dart';

void main() {
  runApp(MyApp());
}

// void main() {
//   runApp(PaginationApp(
//     repository: DesignersFlutterTestsRepository(DesignersFlutterTestService()),
//   ));
// }

class PaginationApp extends StatelessWidget {

  final DesignersFlutterTestsRepository repository;

  PaginationApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DesignersFlutterTestsCubit(repository),
        child: DesignersFlutterTestsView(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title = 'MEDIABROS Flutter I';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
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

    final dummyText = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, ad aliquam animi beatae blanditiis commodi cumque dignissimos dolorem ea est expedita fugit impedit incidunt ipsa laudantium mollitia natus nesciunt officia officiis provident quas qui quibusdam quo reiciendis repudiandae, similique velit vitae! Distinctio eum magnam molestias vero. Autem minus nam sapiente!';
    final commentText = 'This text is very very very very very very very very very very very very very very very very very very very very very very very very very long';
    // final detailText = '1 review - 5 photos';

    final headerImagesList = <Map>[
      {
        'pathImage': 'hector-ramon-perez-oCq2H8_Mguo-unsplash.jpeg',
      },
      {
        'pathImage': 'joss-woodhead-lJKLNrw2fww-unsplash.jpeg',
      },
      {
        'pathImage': 'manuel-torres-garcia--f56LYI4kps-unsplash.jpeg',
      },
      {
        'pathImage': 'pexels-ahmad-zakaria-4767407.jpeg',
      },
      {
        'pathImage': 'pexels-asad-photo-maldives-1483053.jpeg',
      },
      {
        'pathImage': 'pexels-pixabay-221471.jpeg',
      },
      {
        'pathImage': 'pexels-wal-couyi-4148187.jpeg',
      },
    ];

    final reviewList = <Map>[
      {
        'pathImage': 'Carlos.Ramirez.Arabe.jpg',
        'name': 'Carlos Ramirez Arabe',
        'stars': 1.5,
        'comment': commentText,
        'reviewsQty': 1,
        'photosQty': 1,
      },
      {
        'pathImage': 'Carlos.Ramirez.Cycling.jpg',
        'name': 'Carlos J. Ramirez Cycling',
        'stars': 2.0,
        'comment': commentText,
      },
      {
        'pathImage': 'Carlos.Ramirez.Lleras.jpg',
        'name': 'Carlos R. Parque Lleras',
        'stars': 3.0,
        'comment': commentText,
      },
    ];

    return Scaffold(
      // appBar: this.getAppBar(),
      body:Stack(
          children: <Widget>[
            ListView(
                children: <Widget>[

                  DescriptionPlace(
                    description: 'Carlitos Yes',
                    longDescription: dummyText,
                    stars: _counter.toDouble(),
                    // top: 220.0,
                    top: 300.0,
                  ),

                  SectionTitle(title: 'All reviews'),

                  ReviewList(reviewList: reviewList),

                  SectionSpacer(bottom: 60,),
                ]

            ),

            HeaderAppBar(
              title: 'Popular',
              // subtitle: "No lo puedo creer... mi 1er app ever!",
              headerImagesList: headerImagesList,
              // top: 220.0,
              // top: 270.0,
              height: 350.0,
              padding: 25.0,
            ),

          ]
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: 'incrementCounter',
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
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
                                    'https://www.mediabros.com/wp-content/uploads/2016/05/office.jpg',
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
