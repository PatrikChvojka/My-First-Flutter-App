/*import 'package:flutter/material.dart';
import '../flutter_vertical_slider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(
      home: Lighting(),
    ));

class Lighting extends StatefulWidget {
  @override
  State<Lighting> createState() => _LightingState();
}

class _MyTextStyle {
  static const style1 = TextStyle(
    color: Color.fromARGB(255, 47, 128, 67),
    fontSize: 13,
  );
}

class _LightingState extends State<Lighting> {
  var value2 = 0.0;
  Timer? timer;

  void onChanged2(double _value) {
    setState(() => value2 = _value);
    //saveTemperature(_value);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void saveTemperature() async {
    var url =
        Uri.https('www.progresivneaplikacie.sk', '/flutter.php?val=$value2');
    await http.get(url);
  }

  void getData() async {
    // var url = Uri.https('www.progresivneaplikacie.sk', '/project/flutterapp/json.json?v=4');
    var url = Uri.https('www.progresivneaplikacie.sk', '/flutter.php?v=2');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['intensity'];

      setState(() => value2 = itemCount);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => saveTemperature());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("LIGHTING"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Color.fromRGBO(90, 197, 117, 1),
        elevation: 0.0,
        /*leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Lighting');
          },
          icon: Icon(Icons.Lighting),
        ),*/
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.accessibility,
              color: Color.fromRGBO(90, 197, 117, 1),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration:
                  BoxDecoration(color: const Color.fromRGBO(90, 197, 117, 1)),
              accountName: Text(
                "Name Surname",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "namesurnameh@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Lighting'),
              onTap: () {
                Navigator.pushNamed(context, '/Lighting');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        // body background
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/bg2.jpg"),
          // fit: BoxFit.cover,
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Lighting');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 201, 226, 207),
                          shadowColor: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.tips_and_updates_outlined,
                                color: Color.fromARGB(255, 68, 148, 88),
                                size: 40.0,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              DefaultTextStyle.merge(
                                style: _MyTextStyle.style1,
                                child: const Text("LIGHTING"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 226, 235, 228),
                          shadowColor: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color.fromARGB(255, 61, 145, 82),
                                size: 40.0,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              DefaultTextStyle.merge(
                                style: _MyTextStyle.style1,
                                child: const Text("TEMPERATURE"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              const Text(
                'INTENSITY',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  VerticalSlider(
                    onChanged: onChanged2,
                    max: 100,
                    min: 0,
                    value: value2,
                    width: 80,
                    activeTrackColor: Color.fromRGBO(90, 197, 117, 1),
                    inactiveTrackColor: Color.fromRGBO(153, 231, 130, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/