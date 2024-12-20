// import 'package:flutter/material.dart';

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,
//         title: Text('Settings',style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: Colors.black,),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               _buildSettingsItem('Account Information'),
//               _buildSettingsItem('Payment Setting'),
//               _buildSettingsItem('Address Book'),
//               _buildSettingsItemWithSubtitle(
//                   'Messages', 'Receive exclusive offers and personal updates'),
//               _buildCountrySettingItem(),
//               _buildSettingsItem('Account Security'),
//               _buildSettingsItem('Conditions'),
//               _buildSettingsItem('Help'),
//               _buildSettingsItem('Feedback'),
//               _buildSettingsItem('Request Account Deletion'),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 48),
//                   backgroundColor: Color(0xFF1b447d), // Adjust color as needed
//                 ),
//                 onPressed: () {
//                   // Handle logout logic
//                 },
//                 child: Text('Logout'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsItem(String title) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 16),
//           ),
//           Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsItemWithSubtitle(String title, String subtitle) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ],
//           ),
//             Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   Widget _buildCountrySettingItem() {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         children: [
//          CircleAvatar(
//                   // radius: 40,
//                   radius: 18,
//                   backgroundImage: AssetImage('assets/nepal.jpeg'),
//                 ),
//           SizedBox(width: 8),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Country',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Nepal is your current country',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



















import 'package:flutter/material.dart';
import 'package:robust_app/Address/shippingAddress.dart';
import 'package:robust_app/MyAccount/inbox.dart';
import 'package:robust_app/MyAccount/myInformation.dart';
import 'package:robust_app/Screens/checkOutScreen.dart';
import 'package:robust_app/main.dart';

class SettingsScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
      void logOutDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            insetPadding: EdgeInsets.all(16),
            contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Container(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 6, 16, 16),
                    child: Text(
                      "Are you sure you want to Logout ?",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.fromLTRB(35, 15, 0, 20),
                         child: SizedBox(width: 80,
                           child: ElevatedButton(
                            
                                         style: ElevatedButton.styleFrom(
                                           
                                           minimumSize: const Size(double.infinity, 48),
                                           backgroundColor: Colors.red, // Adjust color as needed
                                         ),
                                         onPressed: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                                         },
                                         child: const Text('Yes'),
                                       ),
                         ),
                       ),
                       const SizedBox(width: 30,),
                         Padding(
                         padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                         child: SizedBox(width: 80,
                           child: ElevatedButton(
                            
                                         style: ElevatedButton.styleFrom(
                                           
                                           minimumSize: Size(double.infinity, 48),
                                           backgroundColor: Color(0xFF1b447d), // Adjust color as needed
                                         ),
                                         onPressed: () {
                                           Navigator.pop(context);
                                         },
                                         child: const Text('No'),
                                       ),
                         ),
                       ),
                     ],
                   ),
                  // new FlatButton(
                  //   child: new Text(
                  //     "OK",
                  //     style: TextStyle(color: MyColors.primaryColor),
                  //   ),
                  //   onPressed: () {

                  //   },
                  // ),
                ],
              ),
            ));
      },
    );
  }
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Settings',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSettingsItem('Account Information', () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountInformationScreen()),
                      );
          }),
              _buildSettingsItem('Payment Setting', () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
          }),
         
          _buildSettingsItem('Address Book', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddShippingAddressScreen(),));
          }),
           _buildSettingsItemWithSubtitle('Messages', 'Recive exclusive offers and personal updates', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>InboxScreen() ,));
          }),
             _buildCountrySettingItem(() {
            // Handle the onTap event here
            print('Country setting clicked');
            // For example, navigate to another page:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CountrySelectionPage()),
            // );
          }),
           _buildSettingsItem('Account Security',(){}),
              _buildSettingsItem('Conditions',(){}),
              _buildSettingsItem('Help',(){}),
              _buildSettingsItem('Feedback',(){}),
              _buildSettingsItem('Request Account Deletion',(){}),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Color(0xFF1b447d), // Adjust color as needed
                ),
                onPressed: () {
                  logOutDialog();
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountrySettingItem(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/nepal.jpeg'),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Country',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nepal is your current country',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    ),
  );
}


Widget _buildSettingsItem(String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    ),
  );
}

Widget _buildSettingsItemWithSubtitle(String title, String subtitle, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    ),
  );
}

// Widget _buildCountrySettingItem(VoidCallback onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       margin: EdgeInsets.only(bottom: 12),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 18,
//             backgroundImage: AssetImage('assets/nepal.jpeg'),
//           ),
//           SizedBox(width: 8),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Country',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Nepal is your current country',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

}