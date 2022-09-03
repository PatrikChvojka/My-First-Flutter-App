import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/bottomMenu.dart';
import 'package:flutter_application_1/presentation/widgets/banner_carousel.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
import 'package:flutter_application_1/presentation/widgets/food_carousel_vertical.dart';
import 'package:flutter_application_1/presentation/widgets/menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moja prvá aplikácia',
      theme: style.MainAppStyle().themeData,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: MainMenu(),
      backgroundColor: style.MainAppStyle().bodyBG,
      // body
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  '''Na čo máte dnes chuť''',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  'Patrik?',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: style.MainAppStyle().mainColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // banners
              BannerCarousel(),
              // banners
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Začnite pridaním prvého jedla',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: style.MainAppStyle().mainColor,
                        padding: const EdgeInsets.all(5.0),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('VIAC'),
                    ),
                  ),
                ],
              ),
              // food vertical
              FoodCarouselVertical(),

              // carousel 1
              //DestinationCarousel(),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Naša ponuka',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: style.MainAppStyle().mainColor,
                        padding: const EdgeInsets.all(5.0),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('VIAC'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
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
              ),*/
            ],
          ),
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: bottomMenu(),
    );
  }
}
