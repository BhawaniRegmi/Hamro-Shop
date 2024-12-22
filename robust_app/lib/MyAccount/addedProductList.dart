import 'package:flutter/material.dart';
import 'package:robust_app/MyAccount/addProduct.dart';

import '../Screens/myAccountPage.dart';
import '../Screens/myCart.dart';

class AddedProductList extends StatelessWidget {
  const AddedProductList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
               // color: Colors.black,
               color:  Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
               Navigator.pop(context);
              },
            ),
            title: const Center(
              child: Text(
                'Added Product',
                style: TextStyle(
                  color: Color(0xFF1b447d),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCartPage()),
                  );
                },
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
          
             // const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: SizedBox(width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPageAdd(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1b447d),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Add Product'),
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Uploaded Product List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Divider(),
            ...List.generate(6, (index) {
              return ProductCard();
            }),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Product Detail'),
          content: const Text(" The SleekPhone Pro isn't just a phone; it's a statement. Immerse yourself in a world of vibrant colors and stunning visuals on its expansive [Screen Size] AMOLED display. Capture every moment with the revolutionary [Camera Resolution] camera system, equipped with advanced AI features for breathtaking photos and videos.Powered by the cutting-edge."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/product1.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Air purifier",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text(
                      "Rs 78,000",
                      style: TextStyle(
                          color: Color(0xFF1b447d),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Original Price with Crossed Line
                Row(
                  children: [
                    Text(
                      "Rs 81,104",
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14, // Smaller font size for original price
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    // Discount Percentage
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "30% OFF",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                const Text(
                  "25 Nov 2024",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 4),
                // Size & Colors
                Row(
                  children: [
                    const Text(
                      "Size ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      children: ["XS", "S", "M", "L", "XL"]
                          .map(
                            (size) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: size == "M"
                                    ? Colors.blue
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: size == "M"
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "Color ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Colors.pink,
                        Colors.purple,
                        Colors.black,
                        Colors.green,
                        Colors.orange,
                      ]
                          .map(
                            (color) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
             IconButton(onPressed: (){
              _showAlertDialog(context);
             }, icon: Icon(Icons.remove_red_eye,color: Colors.red,)),
             SizedBox(height: 10,),
             IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPageAdd(),));
             }, icon: Icon(Icons.edit,color:Color(0xFF1b447d),))
            ],
          )
        ],
      ),
    );
  }
}
