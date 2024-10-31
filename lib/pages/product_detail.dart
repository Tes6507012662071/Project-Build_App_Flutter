import 'package:adidas_clone_application/pages/shopping_bag_page.dart';
import 'package:adidas_clone_application/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  const ProductDetailPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the product image
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Display the product title
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Display the product description
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Display the product price
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),

            const SizedBox(height: 20),

            // Add to Bag button
            ElevatedButton(
              onPressed: () {
                final cartProvider = Provider.of<CartProvider>(context, listen: false);
                cartProvider.addToCart({
                  'title': title,
                  'imageUrl': imageUrl,
                  'price': price,
                  'description': description,
                });

                // Navigate to the Shopping Bag Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingBagPage()),
                );
              },
              child: const Text('Add to Bag'),
            ),
          ],
        ),
      ),
    );
  }
}
