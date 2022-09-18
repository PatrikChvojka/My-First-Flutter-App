import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/cart.dart';
import '../../data/models/food_model.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;

class FoodScreen extends StatefulWidget {
  final Food food;

  FoodScreen({required this.food});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // add to cart counter
  int counterFood = 1;

  // changeCounter
  changeCounter(int type) {
    print(type);
    if (type == 1) {
      // plus
      setState(() {
        counterFood++;
      });
    } else {
      // minus
      if (counterFood > 1) {
        setState(() {
          counterFood--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.MainAppStyle().bodyBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // head
          Stack(
            children: [
              Container(
                height: 280.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.food.imageUrl,
                  child: ClipRRect(
                    child: Image.network(
                      height: 140.0,
                      width: 140.0,
                      widget.food.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: style.MainAppStyle().buttonBG,
                        maximumSize: Size(50.0, 50.0),
                        minimumSize: Size(50.0, 50.0),
                      ),
                      child: Icon(
                        size: 23.0,
                        Icons.arrow_back,
                        color: style.MainAppStyle().secondColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        // cart
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: style.MainAppStyle().buttonBG,
                            maximumSize: Size(50.0, 50.0),
                            minimumSize: Size(50.0, 50.0),
                          ),
                          child: Icon(
                            size: 23.0,
                            Icons.shopping_bag_outlined,
                            color: style.MainAppStyle().secondColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCart(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),

          // body
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.price + "€",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: style.MainAppStyle().mainColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        //
                        // minus button
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: style.MainAppStyle().buttonBG,
                            maximumSize: Size(50.0, 50.0),
                            minimumSize: Size(50.0, 50.0),
                          ),
                          child: Icon(
                            size: 30.0,
                            Icons.expand_more_rounded,
                            color: style.MainAppStyle().secondColor,
                          ),
                          onPressed: () {
                            changeCounter(0);
                          },
                        ),
                        SizedBox(width: 10.0),
                        //
                        // counter
                        Text(
                          counterFood.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        //
                        // plus button
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: style.MainAppStyle().mainColor,
                            maximumSize: Size(50.0, 50.0),
                            minimumSize: Size(50.0, 50.0),
                          ),
                          child: Icon(
                            size: 30.0,
                            Icons.expand_less_rounded,
                            color: style.MainAppStyle().buttonBG,
                          ),
                          onPressed: () {
                            changeCounter(1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  widget.food.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 2,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          elevation: 0.0,
          icon: const Icon(Icons.shopping_bag_outlined),
          backgroundColor: style.MainAppStyle().mainColor,
          label: const Text(
            'PRIDAŤ DO KOŠÍKA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          onPressed: () {
            addToCart(widget.food.imageUrl, widget.food.name,
                counterFood.toString(), widget.food.price, widget.food.id);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
