import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/menu.dart';
import 'package:flutter_application_1/data/models/food_model.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    List<MyCartClass>? myOwnCart = [];

    myOwnCart.add(MyCartClass(
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4/2019/06/deep-dish-pizza-chicago.jpg",
        name: "Názov produktu",
        description: "Toto je popis v košíku",
        price: "58.50",
        id: "55"));

    if (myOwnCart != null) {
      // ak mame nieco v kosiku
      return Scaffold(
        backgroundColor: style.MainAppStyle().bodyBG,
        appBar: MainMenu(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: ListView.builder(
              itemCount: myOwnCart.length,
              itemBuilder: (context, index) {
                // item
                var item = myOwnCart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Image.network(
                        height: 140.0,
                        width: 140.0,
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.name),
                      trailing: GestureDetector(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              //cart.remove(item);
                            });
                          }),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else {
      // kosik je prazdny
      return Scaffold(
        backgroundColor: style.MainAppStyle().bodyBG,
        appBar: MainMenu(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Košík je prázdny"),
        ),
      );
    }
  }
}
