/*import 'package:flutter/material.dart';
import '../flutter_vertical_slider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(
      home: carousel(),
    ));

class carousel extends StatefulWidget {
  @override
  State<carousel> createState() => _carouselState();
}

class _MyTextStyle {
  static const style1 = TextStyle(
    color: Color.fromARGB(255, 47, 128, 67),
    fontSize: 13,
  );
}

class _carouselState extends State<carousel> {
  List quotes = [
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 1',
    'Oscar',
    'POLOZKA C 5',
    'Oscar',
  ];

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  CarouselController buttonCarouselController = CarouselController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("carousel"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Color.fromRGBO(90, 197, 117, 1),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.accessibility,
              color: Color.fromRGBO(90, 197, 117, 1),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration:
                  BoxDecoration(color: const Color.fromRGBO(90, 197, 117, 1)),
              accountName: Text(
                "Name Surname",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "namesurnameh@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('carousel'),
              onTap: () {
                Navigator.pushNamed(context, '/carousel');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
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
        )),
        // slider
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: 130.0,
                      enableInfiniteScroll: false,
                      padEnds: false,
                      reverse: false,
                      initialPage: 0,
                      viewportFraction: 0.30,
                      // autoPlay: true,
                      disableCenter: false,
                    ),
                    items: quotes.toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/