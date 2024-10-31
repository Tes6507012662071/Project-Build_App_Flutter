import 'package:adidas_clone_application/pages/product_detail.dart';
import 'package:adidas_clone_application/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Banner Section
            _buildPromotionalBanner(),

            const SizedBox(height: 20),

            // Categories Section
            _buildCategoriesSection(),

            const SizedBox(height: 20),

            // Featured Products Section
            _buildFeaturedProductsSection(context), // Pass context here
          ],
        ),
      ),
    );
  }

  // Section for the promotional banner
  Widget _buildPromotionalBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
        image: const DecorationImage(
          image: NetworkImage(
              'https://media-img-proxy.shopback.co.th/Ggbzccmgy-A/czM6Ly9tZWRpYS1zZXJ2aWNlLXNiLXByb2QtdGgvMjI5ODJiOGItYTFlNC00ODgzLTlhNTItYWUzZmIyYjhmZWM2LTEwODYzLWltZy0yLmpwZw.jpg'), // Replace with a banner image URL
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'New Arrivals',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Section for product categories
  Widget _buildCategoriesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryCard('Shoes', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/011744ef273d4a66b9cc880b980340a2_9366/Samba_OG_ID0478_01_standard.jpg'),
                _buildCategoryCard('Clothing', 'https://assets.adidas.com/images/w_450,f_auto,q_auto/9f15ebeaadf44e48ab6aaf0101047316_9366/HR5866_00_plp_laydown.jpg'),
                _buildCategoryCard('Accessories', 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/2d7b55b0480f4cb38962b4d20a3513b8_9366/duffel-bag.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for each category card
  Widget _buildCategoryCard(String title, String imageUrl) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Section for featured products
  Widget _buildFeaturedProductsSection(BuildContext context) {
    // List of featured products with title, image URL, price, and description
    final List<Map<String, dynamic>> featuredProducts = [
      {
        'title': 'Samba OG',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_B75806_01_00_standard.jpg',
        'price': 115.00,
        'description': 'Originals',
      },
      {
        'title': 'Gazelle Bellingham',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0fb836e5786f44639c0b18ee570b288c_9366/Gazelle_Bellingham_JH5703_01_00_standard_hover.jpg',
        'price': 120.00,
        'description': 'Football',
      },
      {
        'title': 'DYZ Samba',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/466dda98960e43a7ad014d0aa008be9c_9366/DYZ_Samba_IF9703_01_00_standard.jpg',
        'price': 245.00,
        'description': 'Originals',
      },
      {
        'title': 'Goldie SPZL',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0be9fb9a7f4b4451af1a37c000fdc413_9366/Goldie_SPZL_JI2085_01_00_standard.jpg',
        'price': 150.99,
        'description': 'Originals',
      },
      {
        'title': 'Island Club Adilette 22',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7b8e531753824e4e940dafc700fc844b_9366/Island_Club_Adilette_22_HP6522_HM4.jpg',
        'price': 60.00,
        'description': 'Originals',
      },
      {
        'title': 'Predator Freestyle',
        'imageUrl': 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0d6549a93778408296e83dd979bf6a85_9366/Predator_Freestyle_IF6308_HM4_hover.jpg',
        'price': 105.00,
        'description': 'Football',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featuredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final product = featuredProducts[index];
              return _buildProductCard(
                context, // Pass the context here
                product['title'],
                product['imageUrl'],
                product['price'],
                product['description'],
              );
            },
          ),
        ],
      ),
    );
  }

// Helper widget for each product card
Widget _buildProductCard(BuildContext context, String title, String imageUrl, double price, String description) {
  final WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
  bool isInWishlist = wishlistProvider.wishlistItems.any((item) => item['title'] == title);

  return GestureDetector(
    onTap: () {
      // Navigate to the product detail page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            title: title,
            imageUrl: imageUrl,
            price: price,
            description: description,
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isInWishlist ? Icons.favorite : Icons.favorite_border,
                      color: isInWishlist ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      if (isInWishlist) {
                        // Remove from wishlist
                        wishlistProvider.removeFromWishlist({'title': title, 'imageUrl': imageUrl, 'price': price, 'description': description});
                      } else {
                        // Add to wishlist
                        wishlistProvider.addToWishlist({'title': title, 'imageUrl': imageUrl, 'price': price, 'description': description});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}