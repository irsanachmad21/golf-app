import 'dart:convert';
import 'package:flutter/services.dart';

class ProductModel {
  final String name;
  final String image;
  final String price;
  final String description;
  final double rating;

  ProductModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.description,
      required this.rating});

  // Factory constructor untuk membuat instance ProductModel dari JSON.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      rating: json['rating'],
    );
  }

  // Method untuk memuat list produk dari file JSON
  static Future<List<ProductModel>> fetchProducts() async {
    final String response =
        await rootBundle.loadString('assets/json/products.json');
    final data = await json.decode(response);
    return (data['products'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
  }
}
