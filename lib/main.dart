import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:flutter_application_1/presentation/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  bool showHome = prefs.getBool('showHome') ?? false;

  runApp(
    showHome
        ? MaterialApp(
            home: Onboarding(),
          )
        : MaterialApp(
            home: MyApp(),
          ),
  );
}
