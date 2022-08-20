import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'presentation/pages/google_map_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moja prvá aplikácia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Moja prvá aplikácia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  onTapFunction(i) {
    if (i == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ));
    }

    if (i == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoogleMapScreen(),
          ));
    }
  }

  CarouselController buttonCarouselController = CarouselController();

  final List data = [
    {"title": "Image 1", "url": "lib/assets/food03.jpg"},
    {"title": "Image 2", "url": "lib/assets/food01.jpg"},
    {"title": "Image 3", "url": "lib/assets/food02.jpg"},
    {"title": "Image 4", "url": "lib/assets/food03.jpg"},
    {"title": "Image 5", "url": "lib/assets/food01.jpg"},
    {"title": "Image 6", "url": "lib/assets/food02.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        constraints: const BoxConstraints.expand(),
        // body background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/bg2.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),

        // slider
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'Popular right now',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 18.0,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enableInfiniteScroll: false,
                      padEnds: false,
                      reverse: false,
                      initialPage: 0,
                      viewportFraction: 0.40,
                      // autoPlay: true,
                      disableCenter: false,
                    ),
                    items: data.map((item) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: SizedBox(
                          child: Center(
                              child: Column(
                            children: [
                              Image.asset(item["url"], fit: BoxFit.cover),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(item["title"]),
                            ],
                          )),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GoogleMapScreen(),
            )),
        tooltip: 'Google Map',
        child: Icon(Icons.pin_drop_outlined),
      ),*/
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color.fromARGB(255, 0, 153, 255),
        activeColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 255, 255, 255),
        curveSize: 90,
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.pin_drop_outlined, title: 'Map'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => onTapFunction(i),
      ),
    );
  }
}
