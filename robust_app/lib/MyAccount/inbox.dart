import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Screens/myCart.dart';



class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {
        'storeName': 'Gadget Store',
        'lastMessage': 'Your order has been shipped!',
        'time': '10:45 AM',
        'unreadCount': 2,
        'logo': 'assets/s1.jpeg',
      },
      {
        'storeName': 'Fashion Hub',
        'lastMessage': 'New arrivals are here! Check them out.',
        'time': '9:15 AM',
        'unreadCount': 0,
        'logo': 'assets/s2.jpeg',
      },
      {
        'storeName': 'Sports World',
        'lastMessage': 'Your item is out for delivery.',
        'time': 'Yesterday',
        'unreadCount': 1,
        'logo': 'assets/s3.jpeg',
      },
      {
        'storeName': 'Book Paradise',
        'lastMessage': 'Exclusive discount on new releases!',
        'time': 'Mon',
        'unreadCount': 0,
        'logo': 'assets/s4.png',
      },
       {
    'storeName': 'Electronics Mart',
    'lastMessage': 'Your warranty details have been updated.',
    'time': '8:30 AM',
    'unreadCount': 3,
    'logo': 'assets/s5.png',
  },
  {
    'storeName': 'Clothing World',
    'lastMessage': 'Flash sale starts tonight at 8 PM!',
    'time': '8:00 PM',
    'unreadCount': 0,
    'logo': 'assets/s6.png',
  },
  {
    'storeName': 'Toy Kingdom',
    'lastMessage': 'Your gift card has been delivered.',
    'time': 'Sun',
    'unreadCount': 1,
    'logo': 'assets/s7.jpeg',
  },
  {
    'storeName': 'Home Essentials',
    'lastMessage': 'Your invoice is now available for download.',
    'time': '7:00 PM',
    'unreadCount': 0,
    'logo': 'assets/s8.png',
  },
    ];

    return Scaffold(
      appBar:   PreferredSize(
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
                'Inbox',
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
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
           
             // const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                backgroundImage: AssetImage(message['logo']),
                radius: 25,
              ),
              title: Text(
                message['storeName'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                message['lastMessage'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message['time'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (message['unreadCount'] > 0)
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message['unreadCount'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                // Handle message tap
              },
            ),
          );
        },
      ),
    );
  }
}
