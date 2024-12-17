import 'package:flutter/material.dart';



class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
int _calculateDiscountPercentage(int originalPrice, double discountPrice) {
  return ((originalPrice - discountPrice) / originalPrice * 100).round();
}


  String selectedFilter = "All";

  // Sample Order Data
  final List<Map<String, dynamic>> orders = [

  {
    'id': 'Abc-6556',
    'title': 'Portable Blender',
    'price': 15000,
    'color': 'Black',
    'size': 'Small',
    'date': '20 Nov 2024',
    'status': 'Cancelled',
    'statusColor': Colors.pink,
    'image': 'assets/product2.jpg',
  },
  {
    'id': 'Abc-6557',
    'title': 'Deluxe Air Fryer',
    'price': 48000,
    'color': 'Silver',
    'size': 'Large',
    'date': '18 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product3.png',
  },
  {
    'id': 'Abc-6558',
    'title': 'Microwave Oven',
    'price': 35000,
    'color': 'Gray',
    'size': 'Medium',
    'date': '22 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product4.png',
  },
  {
    'id': 'Abc-6559',
    'title': 'Electric Kettle',
    'price': 12000,
    'color': 'White',
    'size': 'Small',
    'date': '27 Nov 2024',
    'status': 'In Progress',
    'statusColor': Colors.orange,
    'image': 'assets/product5.png',
  },
  {
    'id': 'Abc-6560',
    'title': 'Vacuum Cleaner Pro',
    'price': 60000,
    'color': 'Black',
    'size': 'Large',
    'date': '15 Nov 2024',
    'status': 'Cancelled',
    'statusColor': Colors.pink,
    'image': 'assets/product6.png',
  },
  {
    'id': 'Abc-6561',
    'title': 'Handheld Mixer',
    'price': 8000,
    'color': 'Red',
    'size': 'Medium',
    'date': '26 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product1.png',
  },
  {
    'id': 'Abc-6562',
    'title': 'Smart Juicer',
    'price': 25000,
    'color': 'Green',
    'size': 'Medium',
    'date': '19 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product3.png',
  },
  {
    'id': 'Abc-6556',
    'title': 'Portable Blender',
    'price': 15000,
    'color': 'Black',
    'size': 'Small',
    'date': '20 Nov 2024',
    'status': 'Cancelled',
    'statusColor': Colors.pink,
    'image': 'assets/product2.jpg',
  },
  {
    'id': 'Abc-6557',
    'title': 'Deluxe Air Fryer',
    'price': 48000,
    'color': 'Silver',
    'size': 'Large',
    'date': '18 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product3.png',
  },
  {
    'id': 'Abc-6558',
    'title': 'Microwave Oven',
    'price': 35000,
    'color': 'Gray',
    'size': 'Medium',
    'date': '22 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product4.png',
  },
  {
    'id': 'Abc-6559',
    'title': 'Electric Kettle',
    'price': 12000,
    'color': 'White',
    'size': 'Small',
    'date': '27 Nov 2024',
    'status': 'In Progress',
    'statusColor': Colors.orange,
    'image': 'assets/product5.png',
  },
  {
    'id': 'Abc-6560',
    'title': 'Vacuum Cleaner Pro',
    'price': 60000,
    'color': 'Black',
    'size': 'Large',
    'date': '15 Nov 2024',
    'status': 'Cancelled',
    'statusColor': Colors.pink,
    'image': 'assets/product6.png',
  },
  {
    'id': 'Abc-6561',
    'title': 'Handheld Mixer',
    'price': 8000,
    'color': 'Red',
    'size': 'Medium',
    'date': '26 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product1.png',
  },
  {
    'id': 'Abc-6562',
    'title': 'Smart Juicer',
    'price': 25000,
    'color': 'Green',
    'size': 'Medium',
    'date': '19 Nov 2024',
    'status': 'Delivered',
    'statusColor': Colors.purple,
    'image': 'assets/product3.png',
  },
];


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredOrders = selectedFilter == "All"
        ? orders
        : orders.where((order) => order['status'] == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          _buildFilterButtons(),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                return _buildOrderCard(filteredOrders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    final filters = ["All", "In Progress", "Cancelled", "Delivered"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selectedFilter == filter
                    ? Colors.blue.shade100
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: selectedFilter == filter
                        ? Colors.blue
                        : Colors.grey.shade300),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: selectedFilter == filter
                      ? Colors.blue
                      : Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    double discountPrice = order['price'] * 0.7;

    return Card(
      elevation: 4, // Increased elevation for a better shadow
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            order['image'],
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          order['title'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // Discounted Price
    Text(
      "Rs ${discountPrice.toStringAsFixed(0)}",
      style: const TextStyle(
        color: Color(0xFF1b447d),
        fontWeight: FontWeight.bold,
        fontSize: 16, // Adjusted font size for better readability
      ),
    ),
    const SizedBox(width: 8),
         Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  

    // Original Price with Crossed Line
    Text(
      "Rs ${order['price']}",
      style: const TextStyle(
        color: Colors.grey,
        decoration: TextDecoration.lineThrough,
        fontSize: 14, // Smaller font size for original price
      ),
    ),
    const SizedBox(width: 8),

    // Discount Percentage
    Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "${_calculateDiscountPercentage(order['price'], discountPrice)}% OFF",
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    ),
  ],
),

            
            
            const SizedBox(height: 4),
          Text("Color: ${order['color']}, Size: ${order['size']}"),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order['date'],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: order['statusColor'].withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                order['status'],
                style: TextStyle(
                  color: order['statusColor'],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
