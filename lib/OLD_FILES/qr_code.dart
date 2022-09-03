/*import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../presentation/pages/google_map_screen.dart';
import '../../presentation/pages/home.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
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
      backgroundColor: Color.fromARGB(255, 25, 163, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                backgroundColor: Colors.white,
                size: 200.0,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        activeColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 255, 255, 255),
        curveSize: 90,
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.pin_drop_outlined, title: 'Map'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.qr_code, title: 'QR'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 3,
        onTap: (int i) => onTapFunction(i),
      ),
    );
  }
}
*/