// import 'package:flutter/material.dart';
// class ShareScreen extends StatelessWidget {
//   void _showShareDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           contentPadding: EdgeInsets.zero,
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Title Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Share via',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(height: 1, thickness: 1, color: Colors.grey[300]),
//               // GridView Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: GridView.count(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   children: [
//                     _buildShareOption(
//                       context,
//                       icon: Icons.message,
//                       label: 'Messenger',
//                       onTap: () => _handleShareTap(context, 'Messenger'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.message,
//                       label: 'WhatsApp',
//                       onTap: () => _handleShareTap(context, 'WhatsApp'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.telegram,
//                       label: 'Telegram',
//                       onTap: () => _handleShareTap(context, 'Telegram'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.email,
//                       label: 'Gmail',
//                       onTap: () => _handleShareTap(context, 'Gmail'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.share,
//                       label: 'Twitter',
//                       onTap: () => _handleShareTap(context, 'Twitter'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.message,
//                       label: 'LinkedIn',
//                       onTap: () => _handleShareTap(context, 'LinkedIn'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.copy,
//                       label: 'Copy Info',
//                       onTap: () => _handleShareTap(context, 'Copy Info'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.link,
//                       label: 'Copy Link',
//                       onTap: () => _handleShareTap(context, 'Copy Link'),
//                     ),
//                     _buildShareOption(
//                       context,
//                       icon: Icons.sms,
//                       label: 'Send SMS',
//                       onTap: () => _handleShareTap(context, 'Send SMS'),
//                     ),
//                   ],
//                 ),
//               ),
//               // More Button Section
//               TextButton(
//                 onPressed: () {
//                   _handleShareTap(context, 'More');
//                 },
//                 child: Text('More', style: TextStyle(fontSize: 16)),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildShareOption(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.grey[200],
//             child: Icon(icon, size: 28, color: Colors.black),
//           ),
//           SizedBox(height: 8),
//           Text(
//             label,
//             style: TextStyle(fontSize: 14),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleShareTap(BuildContext context, String platform) {
//     Navigator.pop(context); // Close the dialog
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Sharing via $platform...'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Share UI Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _showShareDialog(context),
//           child: Text('Open Share Dialog'),
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share via',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, thickness: 1, color: Colors.grey[300]),
              
              // GridView Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildShareOption(
                      context,
                      icon: Icons.message,
                      label: 'Messenger',
                      onTap: () => _handleShareTap(context, 'Messenger'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.message,
                      label: 'WhatsApp',
                      onTap: () => _handleShareTap(context, 'WhatsApp'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.telegram,
                      label: 'Telegram',
                      onTap: () => _handleShareTap(context, 'Telegram'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.email,
                      label: 'Gmail',
                      onTap: () => _handleShareTap(context, 'Gmail'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.share,
                      label: 'Twitter',
                      onTap: () => _handleShareTap(context, 'Twitter'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.text_decrease,
                      label: 'LinkedIn',
                      onTap: () => _handleShareTap(context, 'LinkedIn'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.copy,
                      label: 'Copy Info',
                      onTap: () => _handleShareTap(context, 'Copy Info'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.link,
                      label: 'Copy Link',
                      onTap: () => _handleShareTap(context, 'Copy Link'),
                    ),
                    _buildShareOption(
                      context,
                      icon: Icons.sms,
                      label: 'Send SMS',
                      onTap: () => _handleShareTap(context, 'Send SMS'),
                    ),
                  ],
                ),
              ),
              
              // More Button Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextButton(
                  onPressed: () {
                    _handleShareTap(context, 'More');
                  },
                  child: Text('More', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 28, color: Colors.black),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share UI Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showShareDialog(context),
          child: Text('Open Share Dialog'),
        ),
      ),
    );
  }
}
