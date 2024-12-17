// import 'package:flutter/material.dart';

// class AccountInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,
//         title: Text('Account Information',style: TextStyle(color: Colors.black),),
//         leading: IconButton(color: Colors.black,
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your asset path
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         padding: EdgeInsets.all(4),
//                         child: Icon(
//                           Icons.camera_alt,
//                           size: 20,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             InfoTile(
//               title: 'Full Name',
//               value: 'Bhawani Regmi',
//               onTap: () {},
//             ),
//             InfoTile(
//               title: 'Change Password',
//               value: '',
//               onTap: () {},
//             ),
//             InfoTile(
//               title: 'Add Mobile',
//               value: 'Not set',
//               onTap: () {},
//             ),
//             InfoTile(
//               title: 'Change Email',
//               value: 'Sa*********@gmail.com',
//               onTap: () {},
//             ),
//             InfoTile(
//               title: 'Gender',
//               value: 'Not set',
//               onTap: () {},
//             ),
//             InfoTile(
//               title: 'Birthday',
//               value: 'Not set',
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InfoTile extends StatelessWidget {
//   final String title;
//   final String value;
//   final VoidCallback onTap;

//   const InfoTile({
//     required this.title,
//     required this.value,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       subtitle: value.isNotEmpty ? Text(value) : null,
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//     );
//   }
// }


import 'package:flutter/material.dart';

class AccountInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Account Information',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile.jpg'), // Replace with the actual image
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                 // SizedBox(height: 8),
                ],
              ),
            ),
            // Settings Options
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSettingsItem('Full Name', 'Bhawani Regmi',() {
                    
                  }),
                  _buildSettingsItem('Change Password', '',(){}),
                  _buildSettingsItem('Add Mobile', 'Not set',(){}),
                  _buildSettingsItem('Change Email', 'Sa*********@gmail.com',(){}),
                  _buildSettingsItem('Gender', 'Not set',(){}),
                  _buildSettingsItem('Birthday', 'Not set',(){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, String subtitle,VoidCallback onTap) {
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
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
