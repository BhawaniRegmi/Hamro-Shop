import 'package:flutter/material.dart';
import 'package:robust_app/MyAccount/inbox.dart';
import 'package:robust_app/Screens/myAccountPage.dart';
import 'package:robust_app/Screens/productDetail.dart';
import 'package:robust_app/Screens/products.dart';
import 'package:robust_app/Screens/searchScreen.dart';
import 'package:robust_app/Screens/wishListPage.dart';

import '../Filter/filter.dart';
import 'myCart.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the selected tab index

  // List of pages corresponding to each BottomNavigationBar item
  final List<Widget> _pages = [
    MyWidget(),
    SearchScreen(searchQuery: ""),
    WishListPage(),
    InboxScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // Reflect the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
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
}

class ProductGrid extends StatelessWidget {
  final List<Map<String, String>> products = [
  {
    'image': 'assets/product1.png',
    'title': 'Robot Vacuum',
    'price': 'Rs 43,931',
    'rating': '4.8',
  },
  {
    'image': 'assets/product2.jpg',
    'title': 'Samsung X6 Ultra',
    'price': 'Rs 81,104',
    'rating': '4.6',
  },
  {
    'image': 'assets/product3.png',
    'title': 'Shaork Vacuum',
    'price': 'Rs 65,521',
    'rating': '4.7',
  },
  {
    'image': 'assets/product4.png',
    'title': 'Toshibi Fridge',
    'price': 'Rs 1,70,169',
    'rating': '4.4',
  },
  {
    'image': 'assets/product5.png',
    'title': 'Air Purifier',
    'price': 'Rs 66,235',
    'rating': '4.3',
  },
  {
    'image': 'assets/product6.png',
    'title': 'Epson Projector',
    'price': 'Rs 54,069',
    'rating': '4.9',
  },
  {
    'image': 'assets/product1.png',
    'title': 'Robot Vacuum',
    'price': 'Rs 43,931',
    'rating': '4.2',
  },
  {
    'image': 'assets/product2.jpg',
    'title': 'Samsung X6 Ultra',
    'price': 'Rs 81,104',
    'rating': '4.5',
  },
  {
    'image': 'assets/product3.png',
    'title': 'Shaork Vacuum',
    'price': 'Rs 65,521',
    'rating': '4.6',
  },
  {
    'image': 'assets/product4.png',
    'title': 'Toshibi Fridge',
    'price': 'Rs 1,70,169',
    'rating': '4.7',
  },
  {
    'image': 'assets/product5.png',
    'title': 'Air Purifier',
    'price': 'Rs 66,235',
    'rating': '4.1',
  },
  {
    'image': 'assets/product6.png',
    'title': 'Epson Projector',
    'price': 'Rs 54,069',
    'rating': '5.0',
  },
  {
    'image': 'assets/product1.png',
    'title': 'Robot Vacuum',
    'price': 'Rs 43,931',
    'rating': '4.0',
  },
  {
    'image': 'assets/product2.jpg',
    'title': 'Samsung X6 Ultra',
    'price': 'Rs 81,104',
    'rating': '4.3',
  },
  {
    'image': 'assets/product3.png',
    'title': 'Shaork Vacuum',
    'price': 'Rs 65,521',
    'rating': '4.8',
  },
  {
    'image': 'assets/product4.png',
    'title': 'Toshibi Fridge',
    'price': 'Rs 1,70,169',
    'rating': '4.9',
  },
  {
    'image': 'assets/product5.png',
    'title': 'Air Purifier',
    'price': 'Rs 66,235',
    'rating': '4.2',
  },
  {
    'image': 'assets/product6.png',
    'title': 'Epson Projector',
    'price': 'Rs 54,069',
    'rating': '4.7',
  },
  {
    'image': 'assets/product1.png',
    'title': 'Robot Vacuum',
    'price': 'Rs 43,931',
    'rating': '4.4',
  },
  {
    'image': 'assets/product2.jpg',
    'title': 'Samsung X6 Ultra',
    'price': 'Rs 81,104',
    'rating': '4.8',
  },
  {
    'image': 'assets/product3.png',
    'title': 'Shaork Vacuum',
    'price': 'Rs 65,521',
    'rating': '4.3',
  },
  {
    'image': 'assets/product4.png',
    'title': 'Toshibi Fridge',
    'price': 'Rs 1,70,169',
    'rating': '4.5',
  },
  {
    'image': 'assets/product5.png',
    'title': 'Air Purifier',
    'price': 'Rs 66,235',
    'rating': '4.6',
  },
  {
    'image': 'assets/product6.png',
    'title': 'Epson Projector',
    'price': 'Rs 54,069',
    'rating': '4.2',
  },
  {
    'image': 'assets/product1.png',
    'title': 'Robot Vacuum',
    'price': 'Rs 43,931',
    'rating': '4.1',
  },
  {
    'image': 'assets/product2.jpg',
    'title': 'Samsung X6 Ultra',
    'price': 'Rs 81,104',
    'rating': '4.7',
  },
  {
    'image': 'assets/product3.png',
    'title': 'Shaork Vacuum',
    'price': 'Rs 65,521',
    'rating': '4.5',
  },
  {
    'image': 'assets/product4.png',
    'title': 'Toshibi Fridge',
    'price': 'Rs 1,70,169',
    'rating': '4.3',
  },
  {
    'image': 'assets/product5.png',
    'title': 'Air Purifier',
    'price': 'Rs 66,235',
    'rating': '4.4',
  },
  {
    'image': 'assets/product6.png',
    'title': 'Epson Projector',
    'price': 'Rs 54,069',
    'rating': '4.6',
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                childAspectRatio: 0.77,
               // childAspectRatio: 0.7, // Adjusts the height/width ratio
                crossAxisSpacing: 8.0,
                // mainAxisSpacing: 8.0,  //// Adjusted spacing
                 mainAxisSpacing: 5.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: {
                            'image': product['image']!,
                            'title': product['title']!,
                            'price': product['price']!,
                            'rating': product['rating']!,
                            // 'description': "Description for ${product['title']}",
                            'description':
                                "The headphone is a sleek  technology, it delivers an immersive listening experience,. Equipped with high-performance drivers, the headphone produces rich bass seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use. the headphone produces rich bass seamless call handling",
                            'images': [product['image']!],
                          },
                        ),
                      ),
                    );
                  },
                  child: _buildProductCard(
                    product['image']!,
                    product['title']!,
                    product['price']!,
                    product['rating']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildProductCard(String image, String title, String price, String rating) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background color of the card
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Shadow color with transparency
          blurRadius: 4, // Blur radius for the shadow
          offset: Offset(0, 2), // Offset for the shadow
        ),
      ],
    ),
    padding: const EdgeInsets.all(8.0), // Padding inside the container
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: AspectRatio(
            aspectRatio: 1, // Ensures the image is square
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          price,
          style: const TextStyle(
            // fontSize: 12,
            fontSize: 11,
            color: Color(0xFF1b447d),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(Icons.star, size: 12, color: Colors.amber),
            const SizedBox(width: 4),
            Text(
              rating,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}

}

// Define separate widgets for each page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Favorites Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Inbox Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Account Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}




// child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 0.68,
//                 ),
//                 itemCount: filteredProducts.length,
//                 itemBuilder: (context, index) {
//                   final product = filteredProducts[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetailsPage(
//                             product: {
//                               'image': product['image']!,
//                               'title': product['title']!,
//                               'price': product['price']!,
//                               'rating': product['rating']!,
//                               // 'description': "Description for ${product['title']}",
//                               'description':
//                                   "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
//                               'images': [product['image']!],
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     child: _buildProductCard(
//                       product['image']!,
//                       product['title']!,
//                       product['price']!,
//                       product['rating']!,
//                     ),
//                   );
//                 },
//               ),