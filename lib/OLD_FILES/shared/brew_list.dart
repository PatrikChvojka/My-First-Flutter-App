/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/shared/brew_object.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Color.fromARGB(255, 140, 0, 255),
            ),
            title: Text(brews[index].name),
            subtitle: Text(brews[index].sugars),
          ),
        );
      },
    );
  }
}
*/