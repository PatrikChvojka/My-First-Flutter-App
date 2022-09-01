import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/google_map_screen.dart';
import 'package:flutter_application_1/presentation/pages/qr_code.dart';
import 'package:flutter_application_1/presentation/widgets/destination_carousel.dart';
import 'package:flutter_application_1/presentation/widgets/hotel_carousel.dart';

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
    if (i == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Qrcode(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 85.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  '''What would you
like to find?''',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Naposledy objednané',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () => print('See all'),
                      child: const Text(
                        'VŠETKY',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // carousel 1
              DestinationCarousel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Obľúbené u zákazníkov',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () => print('See all'),
                      child: const Text(
                        'VŠETKY',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // carousel 2
              HotelCarousel(),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Naposledy objednané',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () => print('See all'),
                      child: const Text(
                        'VŠETKY',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                child: Card(
                    elevation: 5.0,
                    shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset("lib/assets/banner.jpg",
                        fit: BoxFit.cover)),
              ),
            ],
          ),
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
        backgroundColor: Colors.blue,
        activeColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 255, 255, 255),
        curveSize: 70,
        elevation: 0.0,
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.pin_drop_outlined, title: 'Map'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.qr_code, title: 'QR'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => onTapFunction(i),
      ),
    );
  }
}
