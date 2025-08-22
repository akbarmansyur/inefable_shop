import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<List<Product>> getAllProduct() async {
    try {
      // Load JSON dari assets
      final String jsonString = await rootBundle.loadString(
        'assets/data/products.json',
      );

      // Parse JSON
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert ke List<Product>
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      print('Failed to load products: $e');
      print('Error loading products: $e');
      return [];
    }
  }
}
