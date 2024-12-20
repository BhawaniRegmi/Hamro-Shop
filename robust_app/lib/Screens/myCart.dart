// import 'package:flutter/material.dart';
// import 'package:robust_app/Screens/checkOutScreen.dart';
// import 'package:robust_app/Screens/homeScreen.dart';
// import 'package:robust_app/Screens/productDetail.dart';

// class MyCartPage extends StatefulWidget {
//   @override
//   State<MyCartPage> createState() => _MyCartPageState();
// }

// class _MyCartPageState extends State<MyCartPage> {
//   int count = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//       ),
//       body: Stack(children: [
//         SingleChildScrollView(
//           // physics: AlwaysScrollableScrollPhysics,
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Product List",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               // const SizedBox(height: ),
//               // Product Items
//               Column(
//                 children: const [
//                   ProductItem(
//                     image: "assets/product1.png",
//                     name: "Samsung X6",
//                     price: 81104,
//                     quantity: 2,
//                   ),
//                   Divider(),
//                   ProductItem(
//                     image: "assets/product2.jpg",
//                     name: "Toshibi Inverter",
//                     price: 70000,
//                     quantity: 2,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 7),
//               const Text(
//                 "Recommended for you",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               // Recommended Products
//               // Ensure this GridView has constraints
//               Container(
//                 height: 1205, // Set a fixed height for the product grid
//                 child: ProductGridExtended(),
//               ),
//               SizedBox(
//                 height: 110,
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: 16,
//           left: 16,
//           child: Container(
//             padding:
//                 const EdgeInsets.all(16), // Add padding inside the container
//             decoration: BoxDecoration(
//               color: Colors.white, // Background color
//               borderRadius: BorderRadius.circular(8), // Rounded corners
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1), // Subtle shadow
//                   blurRadius: 4,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 // Total and Checkout
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       "Total",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Rs 1,64,999",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1b447d),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     // Within the `FirstRoute` widget:
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CheckoutPage()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: const Color(0xFF1b447d),
//                     ),
//                     child: const Text(
//                       "CheckOut",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }

// class ProductItem extends StatefulWidget {
//   final String image;
//   final String name;
//   final int price;
//   final int quantity;

//   const ProductItem({
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.quantity,
//   });

//   @override
//   State<ProductItem> createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   int count = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset(widget.image, height: 60, width: 60),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.name,
//                 style:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               Text("Rs ${widget.price}"),
//             ],
//           ),
//         ),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.remove),
//               onPressed: () {
//                 setState(() {
//                   if (count > 1)
//                     count--; // Decrease count but prevent negative values
//                 });
//               },
//             ),
//             Text("${count}"),
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 setState(() {
//                   count++; // Increase count
//                 });
//               },
//             ),
//           ],
//         ),
//         IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }

// class RecommendedProduct extends StatelessWidget {
//   final String image;
//   final String name;
//   final int price;

//   const RecommendedProduct({
//     required this.image,
//     required this.name,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8),
//       child: Column(
//         children: [
//           Image.asset(image, height: 80, width: 80),
//           const SizedBox(height: 8),
//           Text(
//             name,
//             style: const TextStyle(fontSize: 12),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             "Rs $price",
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductGridExtended extends StatelessWidget {
//   final List<Map<String, String>> products = [
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product1.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 43,931',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product2.jpg',
//       'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
//       'price': 'Rs 81,104',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product3.png',
//       'title': 'Shaork Robot Vacuum with Self-Empty Base',
//       'price': 'Rs 65,521',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product4.png',
//       'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
//       'price': 'Rs 1,70,169',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product5.png',
//       'title': 'Air Purifier with True HEPA H14 Filter',
//       'price': 'Rs 66,235',
//       'rating': '4.5',
//     },
//     {
//       'image': 'assets/product6.png',
//       'title': 'Epson Mini Portable Projector Wireless',
//       'price': 'Rs 54,069',
//       'rating': '4.5',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, // Number of items per row
//                 childAspectRatio: 0.7, // Adjusts the height/width ratio
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0, // Adjusted spacing
//               ),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Handle tap here, e.g., navigate to a detail screen
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ProductDetailsPage(
//                           product: {
//                             'title': 'Headphone',
//                             'price': 7963,
//                             'rating': 4.5,
//                             'description':
//                                 "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
//                             'images': [
//                               'assets/headphone.jpeg',
//                               'assets/headphone2.jpeg',
//                               'assets/headphone3.jpeg',
//                             ],
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
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 60,
//           child: AspectRatio(
//             aspectRatio: 1, // Ensures the image is square
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           title,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           price,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Color(0xFF1b447d),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Row(
//           children: [
//             const Icon(Icons.star, size: 12, color: Colors.amber),
//             const SizedBox(width: 4),
//             Text(
//               rating,
//               style: const TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:robust_app/Screens/checkOutScreen.dart';
import 'package:robust_app/Screens/homeScreen.dart';
import 'package:robust_app/Screens/productDetail.dart';

class MyCartPage extends StatefulWidget {
  @override
  State<MyCartPage> createState() => _MyCartPageState();
}
class _MyCartPageState extends State<MyCartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/product1.png",
      "name": "Samsung X6",
      "price": 81104,
      "quantity": 2,
    },
    {
      "image": "assets/product2.jpg",
      "name": "Toshibi Inverter",
      "price": 70000,
      "quantity": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(cartItems.length, (index) {
                  final item = cartItems[index];
                  return Column(
                    children: [
                      ProductItem(
                        image: item['image'],
                        name: item['name'],
                        price: item['price'],
                        quantity: item['quantity'],
                        onDelete: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                      const Divider(),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 7),
              const Text(
                "Recommended for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                height: 1205,
                child: ProductGridExtended(),
              ),
              SizedBox(height: 110),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs 1,64,999",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1b447d),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF1b447d),
                    ),
                    child: const Text(
                      "CheckOut",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final int quantity;
  final VoidCallback onDelete;

  const ProductItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, height: 60, width: 60),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("Rs $price"),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {},
            ),
            Text("$quantity"),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ],
    );
  }
}



class ProductGridExtended extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5',
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5',
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5',
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5',
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5',
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5',
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5',
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5',
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5',
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5',
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5',
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5',
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5',
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5',
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5',
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5',
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5',
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5',
    },
    {
      'image': 'assets/product1.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 43,931',
      'rating': '4.5',
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung Galatero X6 Ultra LTE 4G/128GB',
      'price': 'Rs 81,104',
      'rating': '4.5',
    },
    {
      'image': 'assets/product3.png',
      'title': 'Shaork Robot Vacuum with Self-Empty Base',
      'price': 'Rs 65,521',
      'rating': '4.5',
    },
    {
      'image': 'assets/product4.png',
      'title': 'Toshibi 2-Door Inverter 1200L Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '4.5',
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier with True HEPA H14 Filter',
      'price': 'Rs 66,235',
      'rating': '4.5',
    },
    {
      'image': 'assets/product6.png',
      'title': 'Epson Mini Portable Projector Wireless',
      'price': 'Rs 54,069',
      'rating': '4.5',
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
                childAspectRatio: 0.7, // Adjusts the height/width ratio
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0, // Adjusted spacing
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Handle tap here, e.g., navigate to a detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetailsPage(
                          product: {
                            'title': 'Headphone',
                            'price': 7963,
                            'rating': 4.5,
                            'description':
                                "The headphone is a sleek and lightweight audio accessory designed for premium sound quality. Featuring advanced noise-cancellation technology, it delivers an immersive listening experience, perfect for music, movies, and calls. Its ergonomic design ensures comfort during extended use, while the adjustable headband provides a secure fit. Equipped with high-performance drivers, the headphone produces rich bass and clear treble for a balanced sound profile. With a long-lasting battery, it supports wireless connectivity for hours of uninterrupted playback. The built-in microphone offers seamless call handling and voice assistant support. Stylish and durable, it's an ideal choice for both casual and professional use.",
                            'images': [
                              'assets/headphone.jpeg',
                              'assets/headphone2.jpeg',
                              'assets/headphone3.jpeg',
                            ],
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

Widget _buildProductCard(
    String image, String title, String price, String rating) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Card background color
      borderRadius: BorderRadius.circular(8.0), // Border radius for rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Shadow color with opacity
          spreadRadius: 1, // How much the shadow spreads
          blurRadius: 6, // How blurred the shadow is
          offset: Offset(0, 2), // Horizontal and vertical offset of the shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
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
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF1b447d),
            ),
          ),
          const SizedBox(height: 4),
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
    ),
  );
}

}
