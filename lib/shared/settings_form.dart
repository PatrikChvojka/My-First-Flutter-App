import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:flutter_application_1/shared/loading.dart';
import 'package:flutter_application_1/shared/style.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Member?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid!).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Name', icon: Icon(Icons.person)),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() {
                      _currentName = value;
                    }),
                  ),
                  SizedBox(height: 20.0),

                  // dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Name', icon: Icon(Icons.apps_rounded)),
                    value: _currentSugars ?? userData.sugars,
                    onChanged: (val) {
                      setState(() => _currentSugars = val.toString());
                    },
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        child: Text("$sugar sugars"),
                        value: sugar,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.0),

                  // slider
                  Slider(
                    activeColor: Color.fromARGB(255, 140, 0, 255),
                    inactiveColor: Color.fromARGB(255, 224, 186, 255),
                    thumbColor: Color.fromARGB(255, 103, 7, 182),
                    min: 100,
                    max: 900,
                    divisions: 10,
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 140, 0, 255)),
                    ),
                    child: Text("Update"),
                    onPressed: () async {
                      print(_currentName);
                      print(_currentSugars);
                      print(_currentStrength);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
