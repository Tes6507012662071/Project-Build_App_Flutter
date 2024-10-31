import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _wishlistItems = [];

  List<Map<String, dynamic>> get wishlistItems => _wishlistItems;

  void addToWishlist(Map<String, dynamic> product) {
    _wishlistItems.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Map<String, dynamic> product) {
    _wishlistItems.remove(product);
    notifyListeners();
  }
}
