// import 'package:flutter/material.dart';
// import 'package:robust_app/Screens/productDetail.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final List<Map<String, String>> products = [
//     {'image': 'assets/product1.png', 'title': 'Shaork Robot Vacuum with Self-Empty Base', 'price': 'Rs 43,931', 'rating': '4.5'},
//     {'image': 'assets/product2.jpg', 'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB', 'price': 'Rs 81,104', 'rating': '4.5'},
//     {'image': 'assets/product3.png', 'title': 'Shaork Robot Vacuum with Self-Empty Base', 'price': 'Rs 65,521', 'rating': '4.5'},
//     {'image': 'assets/product4.png', 'title': 'Toshibi 2-Door Inverter 1200L Refrigerator', 'price': 'Rs 1,70,169', 'rating': '4.5'},
//     {'image': 'assets/product5.png', 'title': 'Air Purifier with True HEPA H14 Filter', 'price': 'Rs 66,235', 'rating': '4.5'},
//     {'image': 'assets/product6.png', 'title': 'Epson Mini Portable Projector Wireless', 'price': 'Rs 54,069', 'rating': '4.5'},
//   ];

//   List<Map<String, String>> filteredProducts = [];
//   List<String> suggestions = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     filteredProducts = products;
//   }

//   void filterProducts(String query) {
//     setState(() {
//       filteredProducts = products
//           .where((product) =>
//               product['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();

//       suggestions = query.isEmpty
//           ? []
//           : products
//               .map((product) => product['title']!)
//               .where((title) => title.toLowerCase().contains(query.toLowerCase()))
//               .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Search TextField
//                 SizedBox(height: 40,
//                   child: TextField(
//                     controller: searchController,
//                     onChanged: filterProducts,
//                     decoration: InputDecoration(
//                       labelText: 'Search Products',
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//                 // Suggestions Dropdown
//                 if (suggestions.isNotEmpty)
//                   Card(
//                     child: Column(
//                       children: suggestions.map((suggestion) {
//                         return ListTile(
//                           title: Text(suggestion),
//                           onTap: () {
//                             setState(() {
//                               searchController.text = suggestion;
//                               filterProducts(suggestion);
//                               suggestions.clear(); // Clear suggestions on selection
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Product Grid
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.65,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 2,
//               ),
//               itemCount: filteredProducts.length,
//               itemBuilder: (context, index) {
//                 final product = filteredProducts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailsPage(
//                           product: product,
//                         ),
//                       ),
//                     );
//                   },
//                   child: _buildProductCard(
//                     product['image']!,
//                     product['title']!,
//                     product['price']!,
//                     product['rating']!,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(
//       String image, String title, String price, String rating) {
//     return Card(
//       elevation: 4.0,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             height: 70,
//            // width: double.infinity,
//            width: 70,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(price),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             child: Text('⭐ $rating'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:robust_app/Screens/productDetail.dart';

// import '../Filter/filter.dart';
// import 'myCart.dart';

// class SearchScreen extends StatefulWidget {
//   final String searchQuery;

//   SearchScreen({required this.searchQuery});
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<Map<String, String>> filteredProducts = [];

//   @override
//   void initState() {
//     super.initState();
//     filterProducts(widget.searchQuery); // Filter products on screen load
//   }

//   void filterProducts(String query) {
//     setState(() {
//       filteredProducts = products
//           .where((product) =>
//               product['title']!.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   final List<Map<String, String>> products = [
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5'
//     },
//   ];

//   // List<Map<String, String>> filteredProducts = [];
//   List<String> suggestions = [];
//   TextEditingController searchController = TextEditingController();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   filteredProducts = products;
//   // }

//   void updateSuggestions(String query) {
//     setState(() {
//       suggestions = query.isEmpty
//           ? []
//           : products
//               .map((product) => product['title']!)
//               .where(
//                   (title) => title.toLowerCase().contains(query.toLowerCase()))
//               .take(3) // Limit the suggestions to a maximum of 4
//               .toList();
//     });
//   }

//   // void filterProducts(String query) {
//   //   setState(() {
//   //     filteredProducts = products
//   //         .where((product) =>
//   //             product['title']!.toLowerCase() == query.toLowerCase())
//   //         .toList();
//   //     suggestions.clear();
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        drawer: FilterDrawer(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Search TextField
//                 SizedBox(
//                   height: 40,
//                   child:Row(
//   children: [
//     Expanded(
//       child: TextField(
//         controller: searchController,
//         onChanged: updateSuggestions,
//         decoration: InputDecoration(
//           labelText: 'Search Products',
//           border: OutlineInputBorder(),
//           prefixIcon: Icon(Icons.search),
//         ),
//       ),
//     ),
//     Builder(
//       builder: (context) {
//         return IconButton(
//           icon: const Icon(Icons.filter_list),
//           onPressed: () {
//             Scaffold.of(context).openDrawer(); // Opens the drawer
//           },
//         );
//       },
//     ),
//   ],
// ),

//                 ),
//                 // Suggestions Dropdown
//                 if (suggestions.isNotEmpty)
//                   Card(
//                     margin: EdgeInsets.zero, // Removes margin around the Card
//                     child: Column(
//                       children: suggestions.map((suggestion) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical:
//                                   0.0), // Minimal vertical space between suggestions
//                           child: ListTile(
//                             dense: true, // Makes ListTile more compact
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 0.0,
//                                 vertical:
//                                     0.0), // Further reduce padding inside ListTile
//                             title: Text(
//                               suggestion,
//                               style: TextStyle(
//                                 fontSize: 13, // Further reduce font size
//                                 height:
//                                     1.0, // Reduce line height to a minimal value
//                                 fontWeight: FontWeight
//                                     .normal, // Normal weight for compactness
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 searchController.text = suggestion;
//                                 filterProducts(suggestion);
//                                 suggestions
//                                     .clear(); // Clear suggestions on selection
//                               });
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Product Grid
//           Expanded(
//             child: GridView.builder(
//               // padding: const EdgeInsets.all(8.0),
//               padding: const EdgeInsets.all(4.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.65,
//                 crossAxisSpacing: 0,
//                 // mainAxisSpacing: 2,
//                 mainAxisSpacing: 1,
//               ),
//               itemCount: filteredProducts.length,
//               itemBuilder: (context, index) {
//                 final product = filteredProducts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailsPage(
//                           product: product,
//                         ),
//                       ),
//                     );
//                   },
//                   child: _buildProductCard(
//                     product['image']!,
//                     product['title']!,
//                     product['price']!,
//                     product['rating']!,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(
//       String image, String title, String price, String rating) {
//     return Card(
//       elevation: 4.0,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             height: 70,
//             width: 70,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(price),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             child: Text('⭐ $rating'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:robust_app/Screens/productDetail.dart';
// import '../Filter/filter.dart';
// import 'myCart.dart';

// class SearchScreen extends StatefulWidget {
//   final String searchQuery;

//   SearchScreen({required this.searchQuery});
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<Map<String, String>> filteredProducts = [];
//   double minPrice = 0;
//   double maxPrice = double.infinity;
//   double minRating = 0;
//   double maxRating = 5;

//   @override
//   void initState() {
//     super.initState();
//     filterProducts(widget.searchQuery); // Filter products on screen load
//   }

//   void filterProducts(String query) {
//     setState(() {
//       filteredProducts = products
//           .where((product) =>
//               product['title']!.toLowerCase().contains(query.toLowerCase()) &&
//               _isPriceInRange(product['price']!) &&
//               _isRatingInRange(product['rating']!))
//           .toList();
//     });
//   }

//   bool _isPriceInRange(String price) {
//     double productPrice = _parsePrice(price);
//     return productPrice >= minPrice && productPrice <= maxPrice;
//   }

//   bool _isRatingInRange(String rating) {
//     double productRating = double.parse(rating);
//     return productRating >= minRating && productRating <= maxRating;
//   }

//   double _parsePrice(String price) {
//     // Remove 'Rs' and commas and convert to double
//     return double.parse(price.replaceAll('Rs', '').replaceAll(',', '').trim());
//   }

//   final List<Map<String, String>> products = [
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5'
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5'
//     },
//   ];

//   List<String> suggestions = [];
//   TextEditingController searchController = TextEditingController();

//   void updateSuggestions(String query) {
//     setState(() {
//       suggestions = query.isEmpty
//           ? []
//           : products
//               .map((product) => product['title']!)
//               .where(
//                   (title) => title.toLowerCase().contains(query.toLowerCase()))
//               .take(3) // Limit the suggestions to a maximum of 4
//               .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: FilterDrawer(
//   onPriceRangeChanged: (minPrice, maxPrice) {
//     // Handle price range change and filter items
//   },
//   onRatingChanged: (rating) {
//     // Handle rating change and filter items
//   },
// ),

//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Search TextField
//                 SizedBox(
//                   height: 40,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: searchController,
//                           onChanged: updateSuggestions,
//                           decoration: InputDecoration(
//                             labelText: 'Search Products',
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.search),
//                           ),
//                         ),
//                       ),
//                       Builder(
//                         builder: (context) {
//                           return IconButton(
//                             icon: const Icon(Icons.filter_list),
//                             onPressed: () {
//                               Scaffold.of(context).openDrawer(); // Opens the drawer
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Suggestions Dropdown
//                 if (suggestions.isNotEmpty)
//                   Card(
//                     margin: EdgeInsets.zero,
//                     child: Column(
//                       children: suggestions.map((suggestion) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 0.0),
//                           child: ListTile(
//                             dense: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                             title: Text(
//                               suggestion,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 height: 1.0,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 searchController.text = suggestion;
//                                 filterProducts(suggestion);
//                                 suggestions.clear();
//                               });
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Product Grid
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(4.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.65,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 1,
//               ),
//               itemCount: filteredProducts.length,
//               itemBuilder: (context, index) {
//                 final product = filteredProducts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailsPage(
//                           product: product,
//                         ),
//                       ),
//                     );
//                   },
//                   child: _buildProductCard(
//                     product['image']!,
//                     product['title']!,
//                     product['price']!,
//                     product['rating']!,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(
//       String image, String title, String price, String rating) {
//     return Card(
//       elevation: 4.0,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             height: 70,
//             width: 70,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(price),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             child: Text('⭐ $rating'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:robust_app/Screens/productDetail.dart';
// import '../Filter/filter.dart';
// import 'myCart.dart';

// class SearchScreen extends StatefulWidget {
//   final String searchQuery;

//   SearchScreen({required this.searchQuery});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   int rating = 1;
//   List<Map<String, String>> filteredProducts = [];
//   double minPrice = 0;
//   double maxPrice = double.infinity;
//   double minRating = 0;
//   double maxRating = 5;

//   @override
//   void initState() {
//     super.initState();
//     filterProducts(widget.searchQuery); // Filter products on screen load
//   }

//   void filterProducts(String query) {
//     setState(() {
//       filteredProducts = products
//           .where((product) =>
//               product['title']!.toLowerCase().contains(query.toLowerCase()) &&
//               _isPriceInRange(product['price']!) &&
//               _isRatingInRange(product['rating']!))
//           .toList();
//     });
//   }

//   bool _isPriceInRange(String price) {
//     double productPrice = _parsePrice(price);
//     return productPrice >= minPrice && productPrice <= maxPrice;
//   }

//   bool _isRatingInRange(String rating) {
//     double productRating = double.parse(rating);
//     return productRating >= this.rating;
//   }

//   double _parsePrice(String price) {
//     return double.parse(price.replaceAll('Rs', '').replaceAll(',', '').trim());
//   }

//   final List<Map<String, String>> products = [
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '3'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '2'
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '1'
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '5'
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '3'
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '3'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '2'
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '1'
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '5'
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '3'
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4'
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '3'
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '2'
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '1'
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '5'
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '3'
//     },
//   ];

//   unFiltered() {
//     setState(() {
//       filteredProducts = products;
//     });
//   }

//   List<String> suggestions = [];
//   TextEditingController searchController = TextEditingController();

//   void updateSuggestions(String query) {
//     setState(() {
//       if (query.length < 2) {
//         suggestions = [];
//         return;
//       }
//       suggestions = query.isEmpty
//           ? []
//           : products
//               .map((product) => product['title']!)
//               .where(
//                   (title) => title.toLowerCase().contains(query.toLowerCase()))
//               .take(3)
//               .toList();
//     });
//   }

//   void clearSearch() {
//     setState(() {
//       searchController.clear();
//       suggestions.clear();
//     });
//   }

//   FocusNode focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: FilterDrawer(
//         onPriceRangeChanged: (min, max) {
//           setState(() {
//             minPrice = min;
//             maxPrice = max;
//           });
//           filterProducts(searchController.text);
//         },
//         onRatingChanged: (rating) {
//           setState(() {
//             this.rating = rating;
//           });
//           filterProducts(searchController.text);
//         },
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // SizedBox(height: 20),
//                 // Search TextField with clear button
//                 PreferredSize(
//                   preferredSize: const Size.fromHeight(60), // AppBar height
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white, // AppBar background color
//                       border: Border(
//                         bottom: BorderSide(
//                           color: Colors.black, // Border color
//                           width: 1, // Border thickness
//                         ),
//                       ),
//                     ),
//                     child: AppBar(
//                       backgroundColor: Colors
//                           .transparent, // Transparent to show the container color
//                       elevation: 0,
//                       leading: IconButton(
//                         icon: const Icon(Icons.menu, color: Colors.black),
//                         onPressed: () {},
//                       ),
//                       title: const Center(
//                         child: Text(
//                           'ROBUST',
//                           style: TextStyle(
//                               color: Color(0xFF1b447d),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       actions: [
//                         IconButton(
//                           icon: const Icon(Icons.shopping_cart,
//                               color: Colors.black),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => MyCartPage()),
//                             );
//                           },
//                         ),
//                         const CircleAvatar(
//                           radius: 20,
//                           backgroundImage: AssetImage(
//                               'assets/profile.jpg'), // Replace with the path to your local asset
//                         ),
//                         const SizedBox(width: 16),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8,),
//                 SizedBox(
//                   height: 40,
//                   child: Row(
//                     children: [
//                       Flexible(
//                         child: TextField(
//                           focusNode: focusNode,
//                           controller: searchController,
//                           onChanged: updateSuggestions,
//                           decoration: InputDecoration(
//                             labelText: 'Search Products',
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.search),
//                             suffixIcon: searchController.text.isNotEmpty
//                                 ? IconButton(
//                                     icon: Icon(Icons.clear),
//                                     // onPressed: clearSearch, // Clear search when pressed
//                                     onPressed: () {
//                                       clearSearch();
//                                       unFiltered();
//                                     })
//                                 : null,
//                           ),
//                         ),
//                       ),
//                       Builder(
//                         builder: (context) {
//                           return IconButton(
//                             icon: const Icon(Icons.filter_list),
//                             onPressed: () {
//                               Scaffold.of(context)
//                                   .openDrawer(); // Opens the drawer
//                               unFiltered();
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Suggestions Dropdown
//                 if (suggestions.isNotEmpty)
//                   Card(
//                     margin: EdgeInsets.zero,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: suggestions.map((suggestion) {
//                         return SizedBox(
//                           height: 40,
//                           child: ListTile(
//                             dense: true,
//                             contentPadding: EdgeInsets.zero,
//                             title: Text(
//                               suggestion,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 height: 1.0,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 searchController.text = suggestion;
//                                 filterProducts(suggestion);
//                                 suggestions.clear();
//                                 clearSearch();
//                               });
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Product Grid
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(4.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.65,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 1,
//               ),
//               itemCount: filteredProducts.length,
//               itemBuilder: (context, index) {
//                 final product = filteredProducts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => ProductDetailsPage(
//                     //       product: product,
//                     //     ),
//                     //   ),
//                     // );
//                             Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailsPage(
//                           product: {
//                             'image': product['image']!,
//                             'title': product['title']!,
//                             'price': product['price']!,
//                             'rating': product['rating']!,
//                             // 'description': "Description for ${product['title']}",
//                             'description':
//                                 "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
//                             'images': [product['image']!],
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   child: _buildProductCard(
//                     product['image']!,
//                     product['title']!,
//                     product['price']!,
//                     product['rating']!,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(
//       String image, String title, String price, String rating) {
//     return Card(
//       elevation: 4.0,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             height: 70,
//             width: 70,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(price),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             child: Text('⭐ $rating'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:robust_app/Screens/productDetail.dart';
import '../Filter/filter.dart';
import 'myCart.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;

  SearchScreen({required this.searchQuery});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int rating = 1;
  List<Map<String, String>> filteredProducts = [];
  double minPrice = 0;
  double maxPrice = double.infinity;
  double minRating = 0;
  double maxRating = 5;

  @override
  void initState() {
    super.initState();
    filterProducts(widget.searchQuery); // Filter products on screen load
    if (widget.searchQuery.isNotEmpty)
      setState(() {
        searchController.text = widget.searchQuery;
      });
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product['title']!.toLowerCase().contains(query.toLowerCase()) &&
              _isPriceInRange(product['price']!) &&
              _isRatingInRange(product['rating']!))
          .toList();
    });
  }

  bool _isPriceInRange(String price) {
    double productPrice = _parsePrice(price);
    return productPrice >= minPrice && productPrice <= maxPrice;
  }

  bool _isRatingInRange(String rating) {
    double productRating = double.parse(rating);
    return productRating >= this.rating;
  }

  double _parsePrice(String price) {
    return double.parse(price.replaceAll('Rs', '').replaceAll(',', '').trim());
  }

  final List<Map<String, String>> products = [
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
     {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
     {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
        {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
     {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
     {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '3'
    },
  ];

  unFiltered() {
    setState(() {
      filteredProducts = products;
    });
  }

  List<String> suggestions = [];
  TextEditingController searchController = TextEditingController();

  void updateSuggestions(String query) {
    setState(() {
      if (query.length < 2) {
        suggestions = [];
        return;
      }
      suggestions = query.isEmpty
          ? []
          : products
              .map((product) => product['title']!)
              .where(
                  (title) => title.toLowerCase().contains(query.toLowerCase()))
              .take(3)
              .toList();
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      suggestions.clear();
    });
  }

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FilterDrawer(
        onPriceRangeChanged: (min, max) {
          setState(() {
            minPrice = min;
            maxPrice = max;
          });
          filterProducts(searchController.text);
        },
        onRatingChanged: (rating) {
          setState(() {
            this.rating = rating;
          });
          filterProducts(searchController.text);
        },
      ),
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard appears
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      // color: Colors.black,
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
                  title: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xFF1b447d),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyCartPage()),
                        );
                      },
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  TextField(
                    focusNode: focusNode,
                    controller: searchController,
                    onChanged: updateSuggestions,
                    decoration: InputDecoration(
                      labelText: 'Search Products',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: clearSearch,
                            )
                          : null,
                      contentPadding: EdgeInsets.symmetric(
                        vertical:
                            10, // Adjust vertical padding to reduce height
                        horizontal: 12, // Adjust horizontal padding for spacing
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14, // Adjust the font size of the text
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.1), // Shadow color with transparency
                          blurRadius: 6.0, // How blurry the shadow is
                          offset: Offset(0, 3), // Offset of the shadow (x, y)
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(
                        8.0), // Inner padding around the Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1b447d),
                          ),
                          onPressed: () {},
                          child: Text("Best Match"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1b447d),
                            // padding:
                            //     EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          ),
                          onPressed: () {},
                          child: Text("Sale"),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.filter_list),
                              onPressed: () {
                                Scaffold.of(context)
                                    .openDrawer(); // Opens the drawer
                                unFiltered();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Conditional rendering of suggestions
                  if (suggestions.isNotEmpty && focusNode.hasFocus)
                    Card(
                      margin: EdgeInsets.zero, // Removed extra margins
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // Make it as small as needed
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.zero, // Removed ListView padding
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: suggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true, // Reduce ListTile height
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8.0), // Minimized padding
                                title: Text(
                                  suggestions[index],
                                  style: TextStyle(
                                      fontSize: 14), // Smaller font size
                                ),
                                onTap: () {
                                  searchController.text = suggestions[index];
                                  filterProducts(suggestions[index]);
                                  setState(() {
                                    suggestions.clear();
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  // SizedBox(height: 200,)
                ],
              ),
            ),
            // Ensure no extra space is rendered when suggestions are empty
            if (suggestions.isEmpty) SizedBox(height: 0),
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.6,
              height: MediaQuery.of(context).size.height * 0.8,

              child: GridView.builder(
             // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                //childAspectRatio: 0.77,
                childAspectRatio: 0.68, // Adjusts the height/width ratio
                crossAxisSpacing: 1.5,
                // mainAxisSpacing: 8.0,  //// Adjusted spacing
                 mainAxisSpacing: 2.0,
              ),
              // itemCount: products.length,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
               final product = filteredProducts[index];
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
                                  "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
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
              // child: GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     childAspectRatio: 0.68,
              //   ),
              //   itemCount: filteredProducts.length,
              //   itemBuilder: (context, index) {
              //     final product = filteredProducts[index];
              //     return GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => ProductDetailsPage(
              //               product: {
              //                 'image': product['image']!,
              //                 'title': product['title']!,
              //                 'price': product['price']!,
              //                 'rating': product['rating']!,
              //                 // 'description': "Description for ${product['title']}",
              //                 'description':
              //                     "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
              //                 'images': [product['image']!],
              //               },
              //             ),
              //           ),
              //         );
              //       },
              //       child: _buildProductCard(
              //         product['image']!,
              //         product['title']!,
              //         product['price']!,
              //         product['rating']!,
              //       ),
              //     );
              //   },
              // ),

              
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String image, String title, String price, String rating) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('⭐ $rating'),
          ),
        ],
      ),
    );
  }
}
