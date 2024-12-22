// import 'package:flutter/material.dart';

// class WishListPage extends StatelessWidget {
//   final List<Map<String, dynamic>> items = [
//     {
//       'image': 'assets/product6.png',
//       'orderId': 'Abc-6555',
//       'name': 'Coffee Machine',
//       'price': 'Rs 78,000',
//       'date': '25 Nov 2024',
//     },
//     {
//       'image': 'assets/product1.png',
//       'orderId': 'Abc-6555',
//       'name': 'Coffee Machine',
//       'price': 'Rs 78,000',
//       'date': '25 Nov 2024',
//     },
//     {
//       'image': 'assets/product5.png',
//       'orderId': 'Abc-6555',
//       'name': 'Coffee Machine',
//       'price': 'Rs 78,000',
//       'date': '25 Nov 2024',
//     },
//     {
//       'image': 'assets/product3.png',
//       'orderId': 'Abc-6555',
//       'name': 'Coffee Machine',
//       'price': 'Rs 78,000',
//       'date': '25 Nov 2024',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'My WishList',
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(
//                 horizontal: 12, vertical: 6), // Reduced margin
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//               side: const BorderSide(color: Colors.grey),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0), // Reduced padding
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Image.asset(
//                         item['image'],
//                         height: 50, // Reduced height
//                         width: 50, // Reduced width
//                         fit: BoxFit.cover,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 12), // Reduced spacing
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Order ID: ${item['orderId']}',
//                           style: const TextStyle(
//                             color: Colors.pink,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14, // Reduced font size
//                           ),
//                         ),
//                         Text(
//                           item['name'],
//                           style: const TextStyle(
//                             fontSize: 14, // Reduced font size
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           item['price'],
//                           style: const TextStyle(
//                             color: Colors.blue,
//                             fontSize: 13, // Reduced font size
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'Rs 81,104',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 6, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.red.shade100,
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Text(
//                                 '-40%',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           item['date'],
//                           style: const TextStyle(
//                               fontSize: 13), // Reduced font size
//                         ),
//                         Text(
//                           "Color: Red",
//                           style: TextStyle(
//                               fontSize: 13, fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Text(
//                           "Size: Medium",
//                           style: TextStyle(
//                               fontSize: 13, fontWeight: FontWeight.normal),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 8), // Adjusted spacing

//                   Column(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF1b447d),
//                         ),
//                         child: Text(
//                           "Add To Cart",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                         child: Text(
//                           "Buy Now",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   )

//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:robust_app/Filter/menuDrawer.dart';
import 'package:robust_app/Screens/addtoCart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robust_app/Screens/checkOutScreen.dart';

import '../Blocs/CartBlocs/cartBloc.dart';
import '../Blocs/CartBlocs/cartState.dart';
import 'blocCartScreen.dart';
import 'myAccountPage.dart';
import 'myCart.dart';

class WishListPage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/product6.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product1.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product5.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product3.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product6.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product1.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product5.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
    {
      'image': 'assets/product3.png',
      'orderId': 'Abc-6555',
      'name': 'Coffee Machine',
      'price': 'Rs 78,000',
      'date': '25 Nov 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: PreferredSize(
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
                'My Wishlist',
                style: TextStyle(
                  color: Color(0xFF1b447d),
                  fontWeight: FontWeight.bold,
                ),
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
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          item['image'],
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['price'],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF1b447d),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              'Rs 81,104',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                '-40%',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Order ID: ${item['orderId']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Date: ${item['date']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => ProductDetailsDialog(
                              name: "samsung",
                              imagePatho: "",
                              price: "",
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1b447d),
                          minimumSize: const Size(80, 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          textStyle: const TextStyle(fontSize: 11),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(80, 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          textStyle: const TextStyle(fontSize: 11),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
