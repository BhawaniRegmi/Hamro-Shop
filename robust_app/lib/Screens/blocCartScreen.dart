
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../Blocs/CartBlocs/cartBloc.dart';
// import '../Blocs/CartBlocs/cartEvent.dart';
// import '../Blocs/CartBlocs/cartState.dart';

// class MyCartScreen extends StatelessWidget {
//   final List<Map<String, String>> mostSoldProducts = [
//     {'name': 'Product 1', 'image': 'assets/product1.png'},
//     {'name': 'Product 2', 'image': 'assets/product2.jpg'},
//     {'name': 'Product 3', 'image': 'assets/product3.png'},
//     {'name': 'Product 4', 'image': 'assets/product4.png'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cartItems = context.select((CartBloc bloc) => bloc.state.items);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//       ),
//       body: cartItems.isEmpty
//           ? Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/logo.png', // Replace with your empty cart image asset
//                           width: 150,
//                           height: 150,
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Your cart is empty!',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Add items to your cart to see them here.',
//                           style: TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
                
//               ],
//             )
//           : ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartItems[index];
//                 return ListTile(
//                   leading: Image.asset(item.imagePath, width: 50, height: 50),
//                   title: Text(item.name),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Color: ${item.color}'),
//                       Text('Size: ${item.size}'),
//                       Text('Price: Rs ${item.price * item.quantity}'),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.remove),
//                             onPressed: () {
//                               if (item.quantity > 1) {
//                                 context.read<CartBloc>().add(
//                                       UpdateCartItemQuantityEvent(
//                                           item, item.quantity - 1),
//                                     );
//                               }
//                             },
//                           ),
//                           Text('${item.quantity}'),
//                           IconButton(
//                             icon: const Icon(Icons.add),
//                             onPressed: () {
//                               context.read<CartBloc>().add(
//                                     UpdateCartItemQuantityEvent(
//                                         item, item.quantity + 1),
//                                   );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: () {
//                       context.read<CartBloc>().add(RemoveFromCartEvent(item));
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robust_app/Screens/myCart.dart';
import '../Blocs/CartBlocs/cartBloc.dart';
import '../Blocs/CartBlocs/cartEvent.dart';
import '../Blocs/CartBlocs/cartState.dart';

class MyCartScreen extends StatelessWidget {
  final List<Map<String, String>> mostSoldProducts = [
    {'name': 'Product 1', 'image': 'assets/product1.jpg'},
    {'name': 'Product 2', 'image': 'assets/product2.jpg'},
    {'name': 'Product 3', 'image': 'assets/product3.jpg'},
    {'name': 'Product 4', 'image': 'assets/product4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final cartItems = context.select((CartBloc bloc) => bloc.state.items);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          // Section for Cart Items or Empty Cart View
          Expanded(
            flex: 2,
            child: cartItems.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Replace with your empty cart image asset
                        // width: 150,
                        // height: 150,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Your cart is empty!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Add items to your cart to see them here.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.imagePath, width: 50, height: 50),
                        title: Text(item.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Color: ${item.color}'),
                            Text('Size: ${item.size}'),
                            Text('Price: Rs ${item.price * item.quantity}'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (item.quantity > 1) {
                                      context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity - 1));
                                    }
                                  },
                                ),
                                Text('${item.quantity}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity + 1));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveFromCartEvent(item));
                          },
                        ),
                      );
                    },
                  ),
          ),
          // Section for Most Sold Products
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Recent Products',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: ProductGridExtended(),
            // child: GridView.builder(
            //   padding: const EdgeInsets.all(8.0),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 8.0,
            //     mainAxisSpacing: 8.0,
            //     childAspectRatio: 3 / 4,
            //   ),
            //   itemCount: mostSoldProducts.length,
            //   itemBuilder: (context, index) {
            //     final product = mostSoldProducts[index];
            //     return Card(
            //       elevation: 2,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: [
            //           Expanded(
            //             child: Image.asset(
            //               product['image']!,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               product['name']!,
            //               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
