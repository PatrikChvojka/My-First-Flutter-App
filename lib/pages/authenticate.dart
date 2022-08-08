import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sign_in.dart';
import 'package:flutter_application_1/services/register.dart';

void main() => runApp(MaterialApp(
      home: Authenticate(),
    ));

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  CarouselController buttonCarouselController = CarouselController();
  final myController = TextEditingController();

  bool showSignIN = true;
  void toggleView() {
    setState(() {
      showSignIN = !showSignIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIN) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
