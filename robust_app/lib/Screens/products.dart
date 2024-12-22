import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robust_app/Filter/menuDrawer.dart';
import 'package:robust_app/Screens/searchScreen.dart';

import '../Blocs/CartBlocs/cartBloc.dart';
import '../Blocs/CartBlocs/cartState.dart';
import 'blocCartScreen.dart';
import 'homeScreen.dart';
import 'myAccountPage.dart';
import 'myCart.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5'
    },
  ];

  List<String> suggestions = [];
  TextEditingController searchController = TextEditingController();

  void updateSuggestions(String query) {
    setState(() {
      print("Search Query: $query");

      if (query.length < 1) {
        suggestions = [];
        return;
      }

      suggestions = products
          .map((product) => product['title']!.trim()) // Trim whitespace
          .where((title) {
        print(
            "Comparing '${title.toLowerCase()}' with '${query.toLowerCase()}'");
        return title.toLowerCase().contains(query.toLowerCase());
      }).toList();

      print("Suggestions: $suggestions");
    });
  }

  Widget _buildCategoryItem(String label, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25, // Adjust the size as needed
          backgroundImage: AssetImage(imagePath), // Use the image path
          backgroundColor: Colors
              .transparent, // Set background color to transparent for a cleaner look
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('View all',
              style: TextStyle(
                color: Color(0xFF1b447d),
              )),
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, String price) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.grey.shade200,
              child: const Icon(Icons.image, size: 50, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: const TextStyle(fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price, style: const TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String label, String imagePath) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8), // Optional: Add rounded corners
              child: Image.asset(
                imagePath,
                height: 80, // Adjust height
                width: 90, // Adjust width
                fit: BoxFit
                    .cover, // Ensures the image fits within the dimensions
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandLogo(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(imagePath), // Set the image as background
          backgroundColor:
              Colors.transparent, // Optional: Transparent background
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: CustomScrollView(
        slivers: [
          // Persistent AppBar with Box Shadow
          SliverAppBar(
            pinned: true, // Keeps the AppBar at the top while scrolling
            floating: false,
            snap: false,
            backgroundColor: Colors.white,
            elevation: 0, // Remove default shadow
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),

            title: const Center(
              child: Text(
                'ROBUST',
                style: TextStyle(
                    color: Color(0xFF1b447d), fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
        
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCartScreen(),
                              // builder: (context) => MyCartPage(),
                            ),
                          );
                        },
                      ),
                      if (state.itemCount > 0)
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              // borderRadius: BorderRadius.circular(10),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${state.itemCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(
                width: 7,
              ),
               GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                ),
              const SizedBox(width: 16),
            ],
            bottom: PreferredSize(
              preferredSize:
                  const Size.fromHeight(1.0), // Height of the bottom border
              child: Container(
                color: Colors.grey, // Border line color
                height: 1.0, // Border line thickness
              ),
            ),
          ),

          // Main Content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 8),
                      //  const SizedBox(height:4),

                      // Search TextField
                      TextField(
                        controller: searchController,
                        onChanged: updateSuggestions,
                        decoration: InputDecoration(
                          hintText: 'Search for product',
                          prefixIcon: const Icon(Icons.search, size: 18),
                          suffixIcon: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Search",
                              style: TextStyle(color: Color(0xFF1b447d)),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: const TextStyle(fontSize: 12),
                      ),

                      if (suggestions.isNotEmpty)
                        Card(
                          child: Column(
                            children: suggestions.map((suggestion) {
                              return ListTile(
                                dense:
                                    true, // Reduces the vertical padding of the ListTile
                                title: Text(
                                  suggestion,
                                  style: TextStyle(
                                    fontSize: 14, // Reduce font size
                                    color: Colors
                                        .black54, // Optional: Change the text color
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchScreen(searchQuery: suggestion),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),

                      const SizedBox(height: 10),

                      // Categories Row
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCategoryItem(
                                'Electronics', 'assets/electronics.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem('Fashion', 'assets/fashion.png'),
                            const SizedBox(width: 13),
                            _buildCategoryItem('Health', 'assets/health.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'Groceries', 'assets/groceries.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem('Toys', 'assets/toys.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'Furniture', 'assets/furniture.jpg'),
                          ],
                        ),
                      ),

                      // Banner Section
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/banner.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Recommended Section
                      _buildSectionHeader('Recommended for you', () {}),
                      const SizedBox(height: 1.5),
                      Container(
                        height: 280,
                        child: ProductGrid(),
                      ),

                      _buildSectionHeader('Top Categories', () {}),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildCategoryCard("Women", 'assets/men.png'),
                          _buildCategoryCard('Men', 'assets/women.png'),
                          _buildCategoryCard('Kids', 'assets/kids.png'),
                          _buildCategoryCard('Beauty', 'assets/shoes.png'),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Choose Brands
                      _buildSectionHeader('Choose Brands', () {}),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildBrandLogo('Xiaomi', 'assets/mi.png'),
                          _buildBrandLogo('Chanel', 'assets/channel.jpg'),
                          _buildBrandLogo('Dell', 'assets/dell.png'),
                          _buildBrandLogo('Nike', 'assets/nike.jpg'),
                          _buildBrandLogo('Apple', 'assets/apple.png'),
                        ],
                      ),
                      _buildSectionHeader('Top sellers', () {}),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCategoryItem(
                                'GK Shop', 'assets/electronics.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'MR Collection', 'assets/fashion.png'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'Popular Wears', 'assets/health.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'Best Zone', 'assets/groceries.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem('Wear New', 'assets/toys.jpg'),
                            const SizedBox(width: 13),
                            _buildCategoryItem(
                                'Best Wear', 'assets/furniture.jpg'),
                          ],
                        ),
                      ),
                      _buildSectionHeader('Recent Products', () {}),
                      Container(
                        height: 1987,
                        child: ProductGrid(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
