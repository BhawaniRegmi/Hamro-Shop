// import 'package:flutter/material.dart';
// import 'package:robust_app/MyAccount/myInformation.dart';

// class MyAccountPage extends StatefulWidget {
//   @override
//   State<MyAccountPage> createState() => _MyAccountPageState();
// }

// class _MyAccountPageState extends State<MyAccountPage> {
//  bool switch1=false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//            actions: [
//             const CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage(
//                           'assets/profile.jpg'), // Replace with the path to your local asset
//                     ),
//                      IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.black),
//             onPressed: () {},
//           ),

//                   ],
//         title: const Text(
//           'My Account',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),

//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 8.0),
//             child: Text(
//               'Hello, Bhawani Regmi',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ..._buildMenuItems(context),
//           const Divider(height: 32, thickness: 1),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   const Text('I’d like to receive exclusive offers'),
//                    const Text(' and promotions via email'),
//                 ],
//               ),
//               Switch(
//                 value: switch1,
//                 onChanged: (bool value) {
//                 setState(() {
//                    switch1=value;
//                 });
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

// List<Widget> _buildMenuItems(BuildContext context) {
//   final items = [
//     {
//       'icon': Icons.message,
//       'text': 'Message',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()));
//       },
//     },
//     {
//       'icon': Icons.shopping_bag,
//       'text': 'My Orders',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrdersScreen()));
//       },
//     },
//     {
//       'icon': Icons.undo,
//       'text': 'My Returns',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyReturnsScreen()));
//       },
//     },
//     {
//       'icon': Icons.cancel,
//       'text': 'My Cancellations',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyCancellationsScreen()));
//       },
//     },
//     {
//       'icon': Icons.favorite,
//       'text': 'My Wishlist',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
//       },
//     },
//     {
//       'icon': Icons.card_giftcard,
//       'text': 'Vouchers',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => VouchersScreen()));
//       },
//     },
//     {
//       'icon': Icons.star,
//       'text': 'My Reviews',
//       'action': () {
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => MyReviewsScreen()));
//       },
//     },
//     {
//       'icon': Icons.location_on,
//       'text': 'Address Book',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => AddressBookScreen()));
//       },
//     },
//     {
//       'icon': Icons.payment,
//       'text': 'My Payment Options',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOptionsScreen()));
//       },
//     },
//     {
//       'icon': Icons.info,
//       'text': 'Account Information',
//       'action': () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen()));
//       },
//     },
//     {
//       'icon': Icons.settings,
//       'text': 'Setting',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
//       },
//     },
//     {
//       'icon': Icons.policy,
//       'text': 'Policies',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => PoliciesScreen()));
//       },
//     },
//     {
//       'icon': Icons.feedback,
//       'text': 'Feedback',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));
//       },
//     },
//     {
//       'icon': Icons.help,
//       'text': 'Help',
//       'action': () {
//        // Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
//       },
//     },
//     {
//       'icon': Icons.chat,
//       'text': 'Chat with us',
//       'action': () {
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
//       },
//     },
//   ];

//   return items.map((item) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Icon(item['icon'] as IconData, color: Colors.black),
//           title: Text(item['text'] as String),
//           onTap: item['action'] as void Function(),
//         ),
//         const Divider(height: 1, thickness: 1),
//       ],
//     );
//   }).toList();
// }

// }

// import 'package:flutter/material.dart';
// import 'package:robust_app/MyAccount/settings.dart';

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,
//        leading:  BackButton(color: Colors.black,
//        onPressed: () {
//            Navigator.pop(context);
//        },),
//         title: Text('Account',style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings,color: Colors.black,),
//             onPressed: () {
//              Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SettingsScreen()),
//                       );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // User Info Section
//             Row(
//               children: [
//                 CircleAvatar(
//                   // radius: 40,
//                   radius: 25,
//                   backgroundImage: AssetImage('assets/profile.jpg'),
//                 ),
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Bhawani Regmi',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     SizedBox(width: 260,
//                       child: Text('1 WishList | 1 Followed Stores | 1 Vouchers',style: TextStyle(fontSize: 12),)),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),

//             // My Orders Section
//             Text(
//               'My Orders',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             GridView.count(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisCount: 3,
//               // mainAxisSpacing: 8,
//               // crossAxisSpacing: 8,
//                mainAxisSpacing: 2,
//               crossAxisSpacing: 8,

//               children: [
//                 _buildOrderTile(Icons.payment, 'To Pay'),
//                 _buildOrderTile(Icons.local_shipping, 'To Ship'),
//                 _buildOrderTile(Icons.receipt, 'To Receive'),
//                 _buildOrderTile(Icons.reviews, 'To Review'),
//                 _buildOrderTile(Icons.cancel, 'Returns & \n Cancellations'),
//               ],
//             ),
//            // SizedBox(height: 24),

//             // Banner Section
//             Container(
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                   image: AssetImage('assets/banner.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 24),

//             // Options Section
//             GridView.count(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisCount: 3,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               children: [
//                 _buildOptionTile(Icons.message, 'My Messages'),
//                 _buildOptionTile(Icons.support_agent, 'Customer Care'),
//                 _buildOptionTile(Icons.rate_review, 'My Reviews'),
//                 _buildOptionTile(Icons.payment, 'Payment Options'),
//                 _buildOptionTile(Icons.help_outline, 'Help Center'),
//                 _buildOptionTile(Icons.live_tv, 'Robust Live'),
//               ],
//             ),
//           ],
//         ),
//       ),

//     );
//   }

//   Widget _buildOrderTile(IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.blue.shade100,
//           child: Icon(icon, color: Colors.blue),
//         ),
//         SizedBox(height: 8),
//         Text(
//           label,
//           textAlign: TextAlign.center,
//           // style: TextStyle(fontSize: 12),
//           style: TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }

//   Widget _buildOptionTile(IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.green.shade100,
//           child: Icon(icon, color: Colors.green),
//         ),
//         SizedBox(height: 8),
//         Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robust_app/MyAccount/addProduct.dart';
import 'package:robust_app/MyAccount/addedProductList.dart';
import 'package:robust_app/MyAccount/myOrdersList.dart';
import 'package:robust_app/MyAccount/settings.dart';
import 'package:robust_app/Promotion/promoScreen.dart';
import 'package:robust_app/Promotion/referralPage.dart';

import 'myCart.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
            title: const Center(
              child: Text(
                'Profile',
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
              // const CircleAvatar(
              //   radius: 20,
              //   backgroundImage: AssetImage('assets/profile.jpg'),
              // ),
                  IconButton(
            icon: Icon(
              FontAwesomeIcons.gear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
             // const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            // User Info Section
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bhawani Regmi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 WishList | 3 Vouchers | 5 Carts',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),

            // My Orders Section
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              //  Text("View All",style: TextStyle(color: Color(0xFF1b447d),fontWeight: FontWeight.bold),)
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrdersPage(),));
              }, child: Text("View All",style: TextStyle(color: Color(0xFF1b447d),fontWeight: FontWeight.bold),))
              ],
            ),
            //SizedBox(height: 3),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4, // Adjusted to display more icons per row
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildOrderTile(
                  FontAwesomeIcons.wallet,
                  'To Pay',
                  Colors.orange.shade100,
                  Colors.orange,
                ),
                _buildOrderTile(
                  FontAwesomeIcons.truck,
                  'To Ship',
                  Colors.blue.shade100,
                  Colors.blue,
                ),
                _buildOrderTile(
                  FontAwesomeIcons.boxOpen,
                  'To Receive',
                  Colors.green.shade100,
                  Colors.green,
                ),
                _buildOrderTile(
                  FontAwesomeIcons.star,
                  'To Review',
                  Colors.purple.shade100,
                  Colors.purple,
                ),
                _buildOrderTile(
                  FontAwesomeIcons.arrowRotateLeft,
                  'Returns\n& Cancellations',
                  Colors.red.shade100,
                  Colors.red,
                ),
                  _buildOptionTile(
                  FontAwesomeIcons.code,
                  'Referral',
                  Colors.indigo.shade100,
                  Colors.indigo,
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReferralPage(),));
                  }
                ),
              ],
            ),

            SizedBox(height: 5),

            // Banner Section
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.purple.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Exclusive Offers\nComing Soon!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Options Section
           
          
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4, // Adjusted to fit more options
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildOptionTile(
                  FontAwesomeIcons.envelope,
                  'Messages',
                  Colors.blue.shade100,
                  Colors.blue,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.headset,
                  'Customer Care',
                  Colors.teal.shade100,
                  Colors.teal,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.pen,
                  'Reviews',
                  Colors.pink.shade100,
                  Colors.pink,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.creditCard,
                  'Payment',
                  Colors.amber.shade100,
                  Colors.amber,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.circleQuestion,
                  'Help Center',
                  Colors.indigo.shade100,
                  Colors.indigo,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.video,
                  'Live',
                  Colors.cyan.shade100,
                  Colors.cyan,
                  (){}
                ),
                _buildOptionTile(
                  FontAwesomeIcons.plusCircle,
                  'Add Product',
                  Colors.blue.shade100,
                  Colors.blue,
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddedProductList() ,));
                  }
                ),
                   _buildOptionTile(
                  FontAwesomeIcons.gift,
                  'Promotion',
                  Colors.indigo.shade100,
                  Colors.indigo,
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PromoScreen() ,));
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTile(
      IconData icon, String label, Color backgroundColor, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20, // Reduced size
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            color: iconColor,
            size: 16, // Reduced size
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10), // Adjusted font size
        ),
      ],
    );
  }

Widget _buildOptionTile(
    IconData icon,
    String label,
    Color backgroundColor,
    Color iconColor,
    VoidCallback onPressed, // Added onPressed parameter
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed, // Callback on tap
          borderRadius: BorderRadius.circular(20), // Ripple effect within CircleAvatar
          child: CircleAvatar(
            radius: 20, // Reduced size
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 16, // Reduced size
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10), // Adjusted font size
        ),
      ],
    );
  }

}
