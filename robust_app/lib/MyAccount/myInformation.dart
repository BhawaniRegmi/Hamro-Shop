


// import 'package:flutter/material.dart';

// class AccountInformationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,
//         title: Text('Account Information',style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: Colors.black,),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Section
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               child: Column(
//                 children: [
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundImage: AssetImage('assets/profile.jpg'), // Replace with the actual image
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: CircleAvatar(
//                           radius: 16,
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.camera_alt,
//                             size: 16,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                  // SizedBox(height: 8),
//                 ],
//               ),
//             ),
//             // Settings Options
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   _buildSettingsItem('Full Name', 'Bhawani Regmi',() {
                    
//                   }),
//                   _buildSettingsItem('Change Password', '',(){}),
//                   _buildSettingsItem('Add Mobile', 'Not set',(){}),
//                   _buildSettingsItem('Change Email', 'Sa*********@gmail.com',(){}),
//                   _buildSettingsItem('Gender', 'Not set',(){}),
//                   _buildSettingsItem('Birthday', 'Not set',(){}),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsItem(String title, String subtitle,VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 12),
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.grey[300]!),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 if (subtitle.isNotEmpty)
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//               ],
//             ),
//             Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final confirmation = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Set Profile Picture"),
          content: Image.file(File(pickedFile.path), height: 100, fit: BoxFit.cover),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("OK"),
            ),
          ],
        ),
      );

      if (confirmation == true) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  }

  void _editField(String title, String initialValue, Function(String) onSave) {
    final controller = TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter $title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Account Information',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const AssetImage('assets/profile.jpg') as ImageProvider,
                        ),
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tap the camera icon to update profile picture",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Settings Options
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSettingsItem(
                    'Full Name',
                    'Bhawani Regmi',
                    () => _editField(
                      'Full Name',
                      'Bhawani Regmi',
                      (value) => print('Name updated to $value'),
                    ),
                  ),
                  _buildSettingsItem(
                    'Change Password',
                    '',
                    () => _editField(
                      'Password',
                      '',
                      (value) => print('Password updated'),
                    ),
                  ),
                  _buildSettingsItem(
                    'Add Mobile',
                    'Not set',
                    () => _editField(
                      'Mobile',
                      '',
                      (value) => print('Mobile updated to $value'),
                    ),
                  ),
                  _buildSettingsItem(
                    'Change Email',
                    'Sa*********@gmail.com',
                    () => _editField(
                      'Email',
                      'Sa*********@gmail.com',
                      (value) => print('Email updated to $value'),
                    ),
                  ),
                  _buildSettingsItem(
                    'Gender',
                    'Not set',
                    () => _editField(
                      'Gender',
                      '',
                      (value) => print('Gender updated to $value'),
                    ),
                  ),
                  _buildSettingsItem(
                    'Birthday',
                    'Not set',
                    () => _editField(
                      'Birthday',
                      '',
                      (value) => print('Birthday updated to $value'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
