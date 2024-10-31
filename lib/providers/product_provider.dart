import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Running Shoes',
      description: 'Comfortable and durable running shoes.',
      price: 79.99,
      imageUrl: 'https://example.com/shoes.jpg',
    ),
    Product(
      id: '2',
      name: 'Sports Jacket',
      description: 'Wind-resistant jacket for outdoor activities.',
      price: 129.99,
      imageUrl: 'https://example.com/jacket.jpg',
    ),
    Product(
      id: '3',
      name: 'Yoga Mat',
      description: 'Non-slip yoga mat for perfect balance.',
      price: 29.99,
      imageUrl: 'https://example.com/mat.jpg',
    ),
    // Add more products as needed
  ];

  List<Product> get products => _products;
}
