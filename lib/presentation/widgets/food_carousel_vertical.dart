import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/food.dart';
import '../../data/models/food_model.dart';
import 'package:http/http.dart' as http;
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
      child: FutureBuilder<List<Food>>(
        future: fetchFoods(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return FoodList(foods: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  const FoodList({super.key, required this.foods});

  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        Food food = foods[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FoodScreen(
                food: food,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            width: 120.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 148, 70, 0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(-3, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Hero(
                  tag: food.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      height: 100.0,
                      width: 240.0,
                      food.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        height: 45.0,
                        child: Text(
                          food.name,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food.price + "€",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: style.MainAppStyle().secondColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: style.MainAppStyle().buttonBG,
                              maximumSize: Size(35.0, 35.0),
                              minimumSize: Size(35.0, 35.0),
                            ),
                            child: Icon(
                              size: 18.0,
                              Icons.shopping_bag_outlined,
                              color: style.MainAppStyle().secondColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
