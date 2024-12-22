// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:robust_app/Screens/myCart.dart';
// import '../Blocs/CartBlocs/cartBloc.dart';
// import '../Blocs/CartBlocs/cartEvent.dart';
// import '../Blocs/CartBlocs/cartState.dart';

// class MyCartScreen extends StatelessWidget {
//   final List<Map<String, String>> mostSoldProducts = [
//     {'name': 'Product 1', 'image': 'assets/product1.jpg'},
//     {'name': 'Product 2', 'image': 'assets/product2.jpg'},
//     {'name': 'Product 3', 'image': 'assets/product3.jpg'},
//     {'name': 'Product 4', 'image': 'assets/product4.jpg'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cartItems = context.select((CartBloc bloc) => bloc.state.items);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//       ),
//       body: Column(
//         children: [
//           // Section for Cart Items or Empty Cart View
//           Expanded(
//             flex: 2,
//             child: cartItems.isEmpty
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/logo.png', // Replace with your empty cart image asset
//                         // width: 150,
//                         // height: 150,
//                         width: 100,
//                         height: 100,
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Your cart is empty!',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Add items to your cart to see them here.',
//                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                     ],
//                   )
//                 : ListView.builder(
//                     itemCount: cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cartItems[index];
//                       return ListTile(
//                         leading: Image.asset(item.imagePath, width: 50, height: 50),
//                         title: Text(item.name),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Color: ${item.color}'),
//                             Text('Size: ${item.size}'),
//                             Text('Price: Rs ${item.price * item.quantity}'),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove),
//                                   onPressed: () {
//                                     if (item.quantity > 1) {
//                                       context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity - 1));
//                                     }
//                                   },
//                                 ),
//                                 Text('${item.quantity}'),
//                                 IconButton(
//                                   icon: const Icon(Icons.add),
//                                   onPressed: () {
//                                     context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity + 1));
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             context.read<CartBloc>().add(RemoveFromCartEvent(item));
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//           // Section for Most Sold Products
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Recent Products',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: ProductGridExtended(),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/CartBlocs/cartBloc.dart';
import '../Blocs/CartBlocs/cartEvent.dart';
import '../Blocs/CartBlocs/cartState.dart';
import 'homeScreen.dart';
import 'myAccountPage.dart';

class MyCartScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final cartItems = context.select((CartBloc bloc) => bloc.state.items);

    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text("My Cart",
              style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
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
                child:  GestureDetector(
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
                ),
              const SizedBox(width: 16),
            ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Cart Section
            if (cartItems.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/empty.png', // Replace with your empty cart image asset
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Your cart is empty!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'Add items to your cart to see them here.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              )
            else
Column(
  children: [
    ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: [
              Image.asset(item.imagePath, width: 60, height: 60),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Text('Color: ${item.color}', style: const TextStyle(fontSize: 11)),
                        const SizedBox(width: 4),
                        Text('Size: ${item.size}', style: const TextStyle(fontSize: 11)),
                      ],
                    ),
                    Text('Price: Rs ${item.price * item.quantity}', style: const TextStyle(fontSize: 15, color: Color(0xFF1b447d))),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: () {
                          if (item.quantity > 1) {
                            context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity - 1));
                          }
                        },
                      ),
                      Text('${item.quantity}', style: const TextStyle(fontSize: 10)),
                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          context.read<CartBloc>().add(UpdateCartItemQuantityEvent(item, item.quantity + 1));
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 18),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Deletion'),
                            content: const Text('Are you sure you want to delete this item?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  context.read<CartBloc>().add(RemoveFromCartEvent(item));
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  ],
),


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Recent Products Section
           Container(
                        height: 1000,
                        child: ProductGrid(),
                      ),
          ],
        ),
      ),
    );
  }
}
