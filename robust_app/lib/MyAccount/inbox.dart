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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatApp(),));
              },
            ),
          );
        },
      ),
    );
  }
}










class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      theme: ThemeData.light(),
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! Is the new iPhone 15 in stock?', 'isSent': false},
    {'text': 'Yes, it is available! Would you like to place an order?', 'isSent': true},
    {'text': 'What colors do you have?', 'isSent': false},
    {'text': 'We have it in Blue, Black, and Silver. Blue is the most popular one!', 'isSent': true},
    {'text': 'Can you share a picture of the Blue one?', 'isSent': false},
  ];

  void _sendMessage() {
    final String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isSent': true});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage("assets/s1.jpeg") // Replace with a real image
        ),
        title: Text(
          'Shop Chat',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // subtitle: Text(
        //   'Customer Support',
        //   style: TextStyle(color: Colors.green, fontSize: 14),
        // ),
        actions: [
          Icon(Icons.more_vert, color: Colors.black, size: 28),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatBody(messages: _messages),
          ),
          ChatInputField(controller: _controller, onSend: _sendMessage),
        ],
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  ChatBody({required this.messages});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages.map((message) {
          return ChatBubble(
            text: message['text'],
            isSent: message['isSent'],
          );
        }).toList(),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSent;

  ChatBubble({required this.text, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSent ? Colors.white : Colors.grey[300],
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isSent ? Radius.circular(16) : Radius.zero,
            bottomRight: isSent ? Radius.zero : Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  ChatInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10, offset: Offset(0, -4))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions, color: Colors.black54),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Type your message here!',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        onSubmitted: (value) => onSend(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: onSend,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.send, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
