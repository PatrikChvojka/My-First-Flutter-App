import 'package:flutter/material.dart';
import '../../data/models/food_model.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;

class FoodCarouselVertical extends StatefulWidget {
  const FoodCarouselVertical({Key? key}) : super(key: key);
  @override
  State<FoodCarouselVertical> createState() => _FoodCarouselVertical();
}

class _FoodCarouselVertical extends State<FoodCarouselVertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      height: 223.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (BuildContext context, index) {
          Food food = foods[index];
          return Container(
            margin: EdgeInsets.all(5),
            width: 110.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    height: 100.0,
                    width: 240.0,
                    image: AssetImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        height: 40.0,
                        child: Text(
                          food.name,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food.price.toStringAsFixed(2) + "€",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: style.MainAppStyle().secondColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: style.MainAppStyle().buttonBG,
                              ),
                              child: Icon(
                                size: 15.0,
                                Icons.shopping_bag_outlined,
                                color: style.MainAppStyle().secondColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(width: 5.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
