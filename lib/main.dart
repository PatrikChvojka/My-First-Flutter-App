import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
// pages
import 'package:flutter_application_1/presentation/pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MaterialApp(
      theme: style.MainAppStyle().themeData,
      home: Wrapper(showHome: showHome),
    ),
  );
}
