import 'package:flutter/material.dart';
import 'package:robust_app/Screens/myCart.dart';
import 'package:robust_app/Screens/productDetail.dart';

class ProductDetailsDialog extends StatefulWidget {
  int countNumber = 1;
  // ProductDetailsDialog(this.countNumber);
  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  String selectedSize = "M"; // Default selected size

  // To hold the color name on touch
  final Map<Color, String> colorNames = {
    Colors.red: "Red",
    Colors.blue: "Blue",
    Colors.green: "Green",
    Colors.yellow: "Yellow",
    Colors.pink: "Pink",
  };
  Color selectedColor = Colors.blue; // Default selected color
  String selectedColorName = "Blue";

  int count = 1; // Initial count value
  Row counter() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (count > 1)
                count--; // Decrease count but prevent negative values
            });
          },
        ),
        Text(
          "$count", // Display the count
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++; // Increase count
            });
          },
        ),
      ],
    );
  }

  void showAddToCartSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Item is added to cart"), // Text message
          SizedBox(
            height: 35,
          )
        ],
      ),
      behavior:
          SnackBarBehavior.floating, // Makes the Snackbar float above content
      backgroundColor: Color(0xFF1b447d), // Set the Snackbar's background color
      duration:
          const Duration(seconds: 4), // How long the Snackbar stays visible
    );

    // Show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String priceMulti() {
    return (count * 61104).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 40,
                          child: Image.asset("assets/product2.jpg")),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Samsung X6',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rs 61,104',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1b447d),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //SizedBox(width: 8),
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
                            children: [
                              Text(
                                "Color: $selectedColorName",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Size: $selectedSize",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Color',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: colorNames.entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = entry.key;
                            selectedColorName = entry.value;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: entry.key,
                            child: selectedColor == entry.key
                                ? Icon(Icons.check,
                                    color: Colors.white, size: 16)
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: ['XS', 'S', 'M', 'L', 'XL'].map(
                  (size) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: ChoiceChip(
                        label: Text(size),
                        selected: size == selectedSize,
                        onSelected: (isSelected) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 5),
              Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              counter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs ${priceMulti()}', // Correct way to call the function in string interpolation
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1b447d),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // Within the `FirstRoute` widget:
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    showAddToCartSnackbar(
                        context); // Show the Snackbar after popping
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1b447d),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












