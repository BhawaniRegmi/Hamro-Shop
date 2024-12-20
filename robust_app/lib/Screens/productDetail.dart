import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robust_app/Screens/addtoCart.dart';
import 'package:robust_app/Screens/addtoWishList.dart';
import 'package:robust_app/Screens/checkOutScreen.dart';
import 'package:robust_app/Screens/myCart.dart';
import 'package:robust_app/Screens/wishListPage.dart';
import 'package:robust_app/Share/sharingMedia.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Blocs/CartBlocs/cartBloc.dart';
import '../Blocs/CartBlocs/cartState.dart';
import 'blocCartScreen.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Widget _buildShareOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: FaIcon(icon, size: 28, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _handleShareTap(BuildContext context, String platform) {
    Navigator.pop(context); // Close the dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sharing via $platform...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  int count = 1; // Initial count value
  Row counter() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (count > 0)
                count--; // Decrease count but prevent negative values
            });
          },
        ),
        Text(
          "$count", // Display the count
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++; // Increase count
            });
          },
        ),
      ],
    );
  }

  void showAddToWishSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Item  added to WishList"), // Text message
          SizedBox(
            height: 35,
          )
        ],
      ),
      behavior:
          SnackBarBehavior.floating, // Makes the Snackbar float above content
      backgroundColor: Color(0xFF1b447d), // Set the Snackbar's background color
      duration:
          const Duration(seconds: 4), // How long the Snackbar stays visible
    );

    // Show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFEAF2F8), // Light background color
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.product['title'],
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //     // Within the `FirstRoute` widget:
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => MyCartPage()),
        //       );
        //     },
        //     icon: Icon(
        //       Icons.shopping_cart_outlined,
        //       color: Colors.black,
        //     ),
        //   ),
        //   CircleAvatar(
        //     backgroundImage: AssetImage('assets/profile.jpg'),
        //     radius: 15,
        //   ),
        // ],
        actions: [
              // IconButton(
              //   icon: const Icon(Icons.shopping_cart, color: Colors.black),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyCartPage()),
              //     );
              //   },
              // ),
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
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(width: 16),
            ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image carousel
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: AspectRatio(
                        // aspectRatio: 16 / 9,
                        aspectRatio: 16 / 17,
                        child: PageView(
                          children: [
                            // Image.asset('assets/headphone3.jpeg',   '${widget.product['price']}',
                            Image.asset('${widget.product['image']}',
                                fit: BoxFit.cover),
                            Image.asset('assets/headphone2.jpeg',
                                fit: BoxFit.cover),
                            Image.asset('assets/headphone3.jpeg',
                                fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //   const SizedBox(height: 16),
                  // Price and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${widget.product['price']}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1b447d),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rs 1,30,000',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 4),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '-40%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WishListPage(),
                                  ));
                              // Add your functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF1b447d), // Background color
                              padding:
                                  EdgeInsets.all(8), // Adjust padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // Rounded corners
                              ),
                              elevation: 4, // Shadow elevation
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white, // Icon color
                              size: 20, // Icon size
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(widget.product['rating'].toString()),
                          const SizedBox(width: 4),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ShareDialog();
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Description and Other Content
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  ProductDescription(
                      description: widget.product['description']),
                  // Add other sections...
                ],
              ),
            ),
          ),
          // Floating Action Button
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Subtle shadow
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1b447d),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      onPressed: () {
                        showAddToWishSnackbar(context);
                        // Handle button press
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Add'),
                          Icon(Icons.favorite),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                    width: 90,
                    child: ElevatedButton(
                      // Within the `FirstRoute` widget:
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CheckoutPage(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF004D40),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text("Buy Now"),
                    ),
                  ),
                  // counter(),
                  SizedBox(
                    height: 50,
                    width: 105,
                    child: ElevatedButton(
                      // Within the `FirstRoute` widget:
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ProductDetailsDialog(
                            name: "${widget.product['title']}",
                            imagePatho: "${widget.product['image']}",
                            price: "${widget.product['price']}",
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text("Add to Cart"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({Key? key, required this.description})
      : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;
  bool switch1 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            maxLines:
                _isExpanded ? 4 : 200, // Limits to 5 lines unless expanded
            overflow: TextOverflow.ellipsis,
          ),
          //const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(_isExpanded ? 'Show more' : 'Show less'),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 5,
              ),
              Icon(Icons.local_shipping, color: Colors.blue),
              SizedBox(
                width: 4,
              ),
              Text("Express", style: TextStyle(color: Colors.black54)),
              SizedBox(
                width: 102,
              ),
              Icon(Icons.refresh, color: Colors.blue),
              SizedBox(
                width: 4,
              ),
              Text("30-day free return",
                  style: TextStyle(color: Colors.black54)),
              // Icon(Icons.star, color: Colors.blue),
              // Text("Good review", style: TextStyle(color: Colors.black54)),
              // Icon(Icons.verified, color: Colors.blue),
              // Text("Authorized shop", style: TextStyle(color: Colors.black54)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 5,
              ),
              Icon(Icons.star, color: Colors.blue),
              SizedBox(
                width: 4,
              ),
              Text("Good review", style: TextStyle(color: Colors.black54)),
              SizedBox(
                width: 80,
              ),
              Icon(Icons.verified, color: Colors.blue),
              SizedBox(
                width: 4,
              ),
              Text("Authorized shop", style: TextStyle(color: Colors.black54)),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Reviews",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text("4.5/5",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1b447d))),
                  Text(
                    "(99 reviews)",
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber), // Full star
                      Icon(Icons.star, color: Colors.amber), // Full star
                      Icon(Icons.star, color: Colors.amber), // Full star
                      Icon(Icons.star, color: Colors.amber), // Full star
                      Icon(Icons.star_half, color: Colors.amber), // Half star
                    ],
                  )
                ],
              ),
              SizedBox(width: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRatingBar(5, 60),
                  buildRatingBar(4, 20),
                  buildRatingBar(3, 10),
                  buildRatingBar(2, 5),
                  buildRatingBar(1, 4),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Path to your imagefdssf
              radius: 25, // Optional: adjust size of the avatar
            ),
            title: Text("Jevon Raynor"),
            subtitle: Text("Great Product! I loved it."),
            trailing: Text("A day ago"),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Path to your imagefdssf
              radius: 25, // Optional: adjust size of the avatar
            ),
            title: Text("Jason D."),
            subtitle: Text("Awesome Headphone, so great to listen."),
            trailing: Text("3 days ago"),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10), // Adjust padding as needed
                decoration: BoxDecoration(
                  color:
                      Colors.white, // White background color for the container
                  border: Border.all(color: Colors.black), // Black border color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          10), // Optional: Adjust padding as needed
                      decoration: BoxDecoration(
                        color: Color(
                            0xFF1b447d), // Background color for the container
                        borderRadius: BorderRadius.circular(
                            8), // Optional: rounded corners
                      ),
                      child: Icon(
                        Icons.notifications, // Notification icon
                        color: Colors.white, // Icon color
                        size: 24, // Icon size
                      ),
                    ),
                    SizedBox(width: 11),
                    Text("Notify me of promotions"),
                    Switch(
                        value:
                            switch1, // Set the switch state based on the value
                        onChanged: (value) {
                          setState(() {
                            switch1 = value; // Toggle the switch state
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Relevant products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text("View all"),
              ),
            ],
          ),
          SizedBox(
            height: 136,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildRelevantProduct("Headphone", "Rs 7,000", 4.5),
                buildRelevantProduct("Headphone", "Rs 7,000", 4.5),
                buildRelevantProduct("Headphone", "Rs 7,000", 4.5),
              ],
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    ]);
  }

  Widget buildRatingBar(int stars, int percentage) {
    return Row(
      children: [
        Text("$stars"),
        SizedBox(width: 8),
        Container(
          width: 150,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRelevantProduct(String name, String price, double rating) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      child: Column(
        children: [
          Container(
            child: Image.asset("assets/headphone.jpeg"),
            width: 80,
            height: 80,
            color: Colors.grey.shade200,
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 14)),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              Text(rating.toString(), style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class CounterRow extends StatefulWidget {
  @override
  _CounterRowState createState() => _CounterRowState();
}

class _CounterRowState extends State<CounterRow> {
  int count = 1; // Initial count value

  @override
  Widget build(BuildContext context) {
    return counter();
  }

  Row counter() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (count > 0)
                count--; // Decrease count but prevent negative values
            });
          },
        ),
        Text(
          "$count", // Display the count
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++; // Increase count
            });
          },
        ),
      ],
    );
  }
}

class ShareDialog extends StatelessWidget {
  const ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Share via',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildShareIcon(Icons.message, 'Messenger', Colors.blue,
                  () => _launchURL('https://www.messenger.com')),
              // _buildShareIcon(Icons.whatsapp, 'WhatsApp', Colors.green, () => _launchURL('https://api.whatsapp.com/send?text=Hello')),
              _buildShareIcon(
                  Icons.telegram,
                  'Telegram',
                  Colors.blueAccent,
                  () => _launchURL(
                      'https://t.me/share/url?url=https://example.com&text=Hello')),
              _buildShareIcon(
                  Icons.email,
                  'Gmail',
                  Colors.red,
                  () =>
                      _launchURL('mailto:?subject=Check this out&body=Hello')),
              //  _buildShareIcon(Icons.twitter, 'Twitter', Colors.lightBlue, () => _launchURL('https://twitter.com/intent/tweet?text=Hello')),
              //  _buildShareIcon(Icons.linkedin, 'LinkedIn', Colors.blue, () => _launchURL('https://www.linkedin.com/shareArticle?mini=true&url=https://example.com')),
              _buildShareIcon(Icons.copy, 'Copy Info', Colors.grey,
                  () => _copyToClipboard(context, 'Copied Info')),
              _buildShareIcon(Icons.link, 'Copy Link', Colors.teal,
                  () => _copyToClipboard(context, 'https://example.com')),
              _buildShareIcon(Icons.sms, 'Send SMS', Colors.orange,
                  () => _launchURL('sms:?body=Hello')),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareIcon(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _copyToClipboard(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$text copied to clipboard')),
    );
  }
}









// import 'package:flutter/material.dart';

// class ProductDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back),
//         title: Text('Headphone'),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
//           CircleAvatar(
//             backgroundImage: AssetImage('assets/profile.jpg'),
//             radius: 15,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image carousel
//               Center(
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: PageView(
//                     children: [
//                       Image.asset('assets/headphone.jpg', fit: BoxFit.cover),
//                       Image.asset('assets/headphone2.jpg', fit: BoxFit.cover),
//                       Image.asset('assets/headphone3.jpg', fit: BoxFit.cover),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Price and rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Rs 7,963',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber),
//                       const SizedBox(width: 4),
//                       Text('4.5'),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               // Description
//               Text(
//                 'Description',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Built for ultra-fast performance, the thin and lightweight Samsung Galaxy Tab S2 goes over anywhere you go for photos, movies, and required documents on a deepin crisp.',
//                 style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//               ),
//               const SizedBox(height: 16),

//               // Feature list
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildFeatureItem(Icons.local_shipping, 'Express'),
//                   _buildFeatureItem(Icons.verified_user, '30-day free return'),
//                   _buildFeatureItem(Icons.thumb_up, 'Good review'),
//                   _buildFeatureItem(Icons.store, 'Authorized shop'),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Reviews section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Reviews',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text('View all'),
//                   ),
//                 ],
//               ),
//               _buildReview('Jevon Raynor', 'Great Product I loved it.', 'A day ago'),
//               _buildReview('Jason D.', 'Awesome Headphone so great to listen.', '3 days ago'),
//               const SizedBox(height: 16),

//               // Relevant products
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Relevant products',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text('View all'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     _buildRelevantProduct('assets/headphone.jpg', 'Rs 7,000'),
//                     _buildRelevantProduct('assets/headphone2.jpg', 'Rs 7,000'),
//                     _buildRelevantProduct('assets/headphone3.jpg', 'Rs 7,000'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Add to cart section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.favorite_border, color: Colors.red),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.remove),
//                       ),
//                       Text('1'),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.add),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Add to Cart'),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureItem(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(icon, color: Colors.blue),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(fontSize: 12, color: Colors.grey[700]),
//         ),
//       ],
//     );
//   }

//   Widget _buildReview(String name, String review, String time) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage('assets/profile.jpg'),
//             radius: 20,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 Text(review),
//                 const SizedBox(height: 4),
//                 Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRelevantProduct(String imagePath, String price) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
//           ),
//           const SizedBox(height: 4),
//           Text(price, style: TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

