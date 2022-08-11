/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter_application_1/shared/brew_list.dart';
import 'package:flutter_application_1/shared/brew_object.dart';

import 'package:flutter_application_1/shared/settings_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  onTapFunction(i) {
    print('click index=$i');
  }

  Widget build(BuildContext context) {
    void _showSettingsPanel(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              child: SettingsForm(),
            );
          });
    }

    return Container(
      color: Colors.brown[100],
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Color.fromARGB(255, 140, 0, 255),
          foregroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () => _showSettingsPanel(context),
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
        body: StreamProvider<List<Brew>>.value(
          initialData: [],
          value: DatabaseService(uid: ' ').brews,
          child: const BrewList(),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Color.fromARGB(255, 140, 0, 255),
          activeColor: Color.fromARGB(255, 255, 255, 255),
          color: Color.fromARGB(255, 255, 255, 255),
          curveSize: 90,
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) => onTapFunction(i),
        ),
      ),
    );
  }
}
*/