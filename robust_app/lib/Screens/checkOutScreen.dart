import 'package:flutter/material.dart';
import 'package:robust_app/Address/shippingAddress.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Track the selected payment option
  String? selectedPaymentOption;
  Widget _buildPaymentOption(String title) {
    return RadioListTile(
      visualDensity: VisualDensity(vertical: -4), // Reduces vertical space
      value: title,
      groupValue: selectedPaymentOption, // Bind to the groupValue
      onChanged: (value) {
        setState(() {
          selectedPaymentOption = value; // Update the selected value
        });
      },
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                  Container(
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
                    children: [
                      Image.asset(
                        "assets/product1.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Samsung X6",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty:3",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Rs 81,104",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF1b447d)),
                                ),
                                
                                Text(
                                  "Brand:Samsung",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                              Row(
                            children: [
                              Text(
                                'Rs 81,104',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Color:Black",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "Size:Medium",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text("View all",
                      //       style: TextStyle(
                      //         color: Color(0xFF1b447d),
                      //       )),
                      // ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
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
                    children: [
                      Image.asset(
                        "assets/product1.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Samsung X6",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty:3",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Rs 81,104",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF1b447d)),
                                ),
                                Text(
                                  "Brand:Samsung",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rs 81,104',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Color:Black",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "Size:Medium",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text("View all",
                      //       style: TextStyle(
                      //         color: Color(0xFF1b447d),
                      //       )),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                    children: [
                      Image.asset(
                        "assets/product1.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Samsung X6",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty:3",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Rs 81,104",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF1b447d)),
                                ),
                                Text(
                                  "Brand:Samsung",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rs 81,104',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Color:Black",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "Size:Medium",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text("View all",
                      //       style: TextStyle(
                      //         color: Color(0xFF1b447d),
                      //       )),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                    children: [
                      Image.asset(
                        "assets/product1.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Samsung X6",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty:3",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Rs 81,104",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF1b447d)),
                                ),
                                Text(
                                  "Brand:Samsung",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rs 81,104',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Color:Black",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "Size:Medium",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text("View all",
                      //       style: TextStyle(
                      //         color: Color(0xFF1b447d),
                      //       )),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: // Promo Code
                      Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Promo Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1b447d),
                          ),
                          child: const Text("Apply"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "My address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //  const SizedBox(height: 6),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.blue),
                  title: const Text("Baneshwor, Kathmandu"),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddShippingAddressScreen()),
                      );
                    },
                    child: const Text(
                      "Change Address",
                      style: TextStyle(
                        color: Color(0xFF1b447d),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 16),
                const Text(
                  "Payment method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    _buildPaymentOption("Master Card"),
                    _buildPaymentOption("SCT ATM Card"),
                    _buildPaymentOption("Visa Card"),
                    _buildPaymentOption("eSewa"),
                    _buildPaymentOption("Cash on Delivery"),
                  ],
                ),
                //     const SizedBox(height: 16),
                const Text(
                  "Order info",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Subtotal"),
                    Text("Rs 1,35,000",
                        style: TextStyle(
                          color: Color(0xFF1b447d),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Delivery Fee"),
                    Text("Rs 262",
                        style: TextStyle(
                          color: Color(0xFF1b447d),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Promotion"),
                    Text(
                      "Rs -52",
                      style: TextStyle(
                        color: Color(0xFF1b447d),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding:
                const EdgeInsets.all(16), // Add padding inside the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Subtle shadow
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Total and Checkout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs 1,64,999",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1b447d),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // Within the `FirstRoute` widget:
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CheckoutPage()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF1b447d),
                    ),
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
