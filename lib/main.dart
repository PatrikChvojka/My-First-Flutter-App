import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/user.dart';
import 'pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<Member?>.value(
    initialData: null,
    catchError: (User, user) {},
    value: AuthService().user,
    child: MaterialApp(
      initialRoute: '/wrapper',
      routes: {
        '/wrapper': (context) => const Wrapper(),
      },
    ),
  ));
}
