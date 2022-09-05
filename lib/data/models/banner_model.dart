import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<FrontBanner>> fetchAlbum(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://progresivneaplikacie.sk/project/flutter/banner.json'));

  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<FrontBanner> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<FrontBanner>((json) => FrontBanner.fromJson(json)).toList();
}

class FrontBanner {
  String imageUrl;
  String name;
  String description;

  FrontBanner({
    required this.imageUrl,
    required this.name,
    required this.description,
  });

  factory FrontBanner.fromJson(Map<String, dynamic> json) {
    return FrontBanner(
      imageUrl: json['image'] as String,
      name: json['title'] as String,
      description: json['Description'] as String,
    );
  }
}
