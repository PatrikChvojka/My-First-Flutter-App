import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/bottomMenu.dart';
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
    if (myOwnCart != null) {
      // ak mame nieco v kosiku
      return Scaffold(
        backgroundColor: style.MainAppStyle().bodyBG,
        appBar: MainMenu(),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myOwnCart?.length,
                    itemBuilder: (context, index) {
                      // item
                      var item = myOwnCart![index];
                      return Slidable(
                        key: Key(myOwnCart![index].id),
                        // start
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {
                            removeFromCart(myOwnCart![index].id);
                          }),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                removeFromCart(myOwnCart![index].id);
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        // end
                        /*
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
                        ),*/
                        // body
                        child: Container(
                          child: Container(
                            height: 70.0,
                            margin: const EdgeInsets.fromLTRB(
                                0.0, 10.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            height: 70.0,
                                            width: 70.0,
                                            item.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 250.0,
                                          child: Text(
                                            item.name,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          item.price + "€",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color:
                                                style.MainAppStyle().mainColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black12,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cena celkom:",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: style.MainAppStyle().mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "50.00€",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: style.MainAppStyle().mainColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
        /* BOTTOM MENU */
        bottomNavigationBar: bottomMenu(),
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
