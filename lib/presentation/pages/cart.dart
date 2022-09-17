import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/menu.dart';
import 'package:flutter_application_1/data/models/food_model.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
import 'package:flutter_slidable/flutter_slidable.dart';

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
        name: "Názov produktu 1",
        description: "Toto je popis v košíku 1",
        price: "18.50",
        id: "1"));

    myOwnCart.add(MyCartClass(
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4/2019/06/deep-dish-pizza-chicago.jpg",
        name: "Názov produktu 2",
        description: "Toto je popis v košíku 2",
        price: "28.50",
        id: "2"));

    myOwnCart.add(MyCartClass(
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4/2019/06/deep-dish-pizza-chicago.jpg",
        name: "Názov produktu 3",
        description: "Toto je popis v košíku 3",
        price: "38.50",
        id: "3"));

    /*
        myOwnCart.removeWhere((element){
      return element.id == "3";
});
         */

    if (myOwnCart != null) {
      // ak mame nieco v kosiku
      return Scaffold(
        backgroundColor: style.MainAppStyle().bodyBG,
        appBar: MainMenu(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: myOwnCart.length,
              itemBuilder: (context, index) {
                // item
                var item = myOwnCart[index];
                return Slidable(
                  key: Key(myOwnCart[index].id),
                  // start
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    //dismissible: DismissiblePane(onDismissed: () {}),
                    children: const [
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  // end
                  endActionPane: const ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                    ],
                  ),
                  // body
                  child: Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.description + "\n" + item.price),
                    ),
                  ),
                );
              }),
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
