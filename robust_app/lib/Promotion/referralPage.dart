



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart'; // For Clipboard functionality
import 'package:url_launcher/url_launcher.dart';

import '../Screens/myCart.dart'; // For launching URLs

class ReferralPage extends StatelessWidget {
  const ReferralPage({Key? key}) : super(key: key);

  final String referralCode = "ABC12342";

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
                color: Colors.grey,
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
                'Referral',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Profile Image Section
              Container(
                decoration: const BoxDecoration(
                //  color: Color(0xFF1B4F72),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: const [
                  //  SizedBox(height: 20),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/re.png'), // Replace with local asset image
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

            //  const SizedBox(height: 20),

              // Referral Code Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
        children: [
          const Text(
            "REFERRAL CODE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade700),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  referralCode,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: referralCode));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Referral code copied to clipboard!")),
                    );
                  },
                  child: const Text(
                    "Copy",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Share your code via",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShareIcon(
                FontAwesomeIcons.whatsapp,
                Colors.green,
                () => _shareOnWhatsApp(),
              ),
              const SizedBox(width: 20),
              _buildShareIcon(
                FontAwesomeIcons.facebookMessenger,
                Colors.blue,
                () => _shareOnMessenger(),
              ),
              const SizedBox(width: 20),
              _buildShareIcon(
                FontAwesomeIcons.instagram,
                Colors.pinkAccent,
                () => _shareOnInstagram(),
              ),
            ],
          ),
        ],
      ),
              ),

              const SizedBox(height: 10),

              // Referral Stats Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Total Referral Code Used : 10",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/c.png', // Replace with your asset image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Total earned",
                              style: TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            Text(
                              "Rs 1,000",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1b447d),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              
            ],
          ),
        ),
      ),
    );
  }

  // Widget to Build Share Icons
  Widget _buildShareIcon(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          icon,
          color: color,
          size: 28,
        ),
      ),
    );
  }

  // Share via WhatsApp
  void _shareOnWhatsApp() async {
    final url = Uri.parse("https://wa.me/?text=Use my referral code: ABC12342");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  // Share via Messenger
  void _shareOnMessenger() async {
    final url = Uri.parse(
        "fb-messenger://share?link=https://example.com&app_id=123456789&text=Use my referral code: ABC12342");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Launch Messenger website as fallback
      final webUrl = Uri.parse(
          "https://www.messenger.com/t/?text=Use my referral code: ABC12342");
      await launchUrl(webUrl);
    }
  }

  // Share via Instagram
  void _shareOnInstagram() async {
    final url = Uri.parse("https://www.instagram.com/direct/new/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
