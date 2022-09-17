import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Food>> fetchFoods(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://progresivneaplikacie.sk/project/flutter/food.json'));

  return compute(parseFood, response.body);
}

List<Food> parseFood(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Food>((json) => Food.fromJson(json)).toList();
}

class Food {
  String imageUrl;
  String name;
  String description;
  String price;

  Food({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      imageUrl: json['image'] as String,
      name: json['title'] as String,
      description: json['desc'] as String,
      price: json['price'] as String,
    );
  }
}

// cart
class MyCartClass {
  String imageUrl;
  String name;
  String description;
  String price;
  String id;

  MyCartClass({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.id,
  });
}
