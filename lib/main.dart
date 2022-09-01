import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway', // main font
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(showHome: showHome),
    ),
  );
}
