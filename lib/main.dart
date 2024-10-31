import 'package:adidas_clone_application/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/shopping_bag_page.dart';
import 'pages/wishlist_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const AdidasCloneApp(),
    ),
  );
}

class AdidasCloneApp extends StatelessWidget {
  const AdidasCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adidas Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Make AppBar white
          iconTheme: IconThemeData(color: Colors.black), // Set icons to dark
          titleTextStyle: TextStyle(
            color: Colors.black, 
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/cart': (context) => ProfilePage(),
        '/productDetail': (context) => ShoppingBagPage(),
        '/productListing': (context) => WishlistPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    WishlistPage(),
    ShoppingBagPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: _onTabTapped,
  selectedItemColor: Colors.black, // Dark color for selected icon
  unselectedItemColor: Colors.grey, // Grey for unselected icons
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Shop',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_outlined),
      label: 'Whishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Shopping bag',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: 'Profile',
    ),
  ],
),
    );
  }}