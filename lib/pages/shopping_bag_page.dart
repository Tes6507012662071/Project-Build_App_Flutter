// shopping_bag_page.dart
import 'package:adidas_clone_application/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingBagPage extends StatelessWidget {
  const ShoppingBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your shopping bag is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item['title']),
                        subtitle: Text('\$${item['price']}'),
                        leading: Image.network(item['imageUrl']),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement your payment logic here
                      _showPaymentConfirmation(context);
                    },
                    child: const Text('Pay'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // Full width
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _showPaymentConfirmation(BuildContext context) {
    // Show a simple confirmation dialog or navigate to a payment screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: const Text('Proceed to payment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement your payment processing logic here
                Navigator.of(context).pop(); // Close the dialog
                // You can navigate to a payment success screen or clear the cart
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
