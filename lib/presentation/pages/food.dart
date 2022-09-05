import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/bottomMenu.dart';
import 'package:flutter_application_1/presentation/widgets/menu.dart';
import '../../data/models/food_model.dart';

class FoodScreen extends StatefulWidget {
  final Food food;

  FoodScreen({required this.food});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainMenu(),
      body: Column(
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
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  height: 140.0,
                  width: 140.0,
                  widget.food.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(widget.food.name),
        ],
      ),
      bottomNavigationBar: bottomMenu(),
    );
  }
}
