import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
// pages
import 'package:flutter_application_1/presentation/pages/google_map_screen.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';

class bottomMenu extends StatelessWidget {
  const bottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return ConvexAppBar(
      backgroundColor: style.MainAppStyle().mainColor,
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
    );
  }
}
