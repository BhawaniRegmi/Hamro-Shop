import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  final Map<Color, String> colorNames = {
    Colors.red: "Red",
    Colors.green: "Green",
    Colors.blue: "Blue",
    Colors.orange: "Orange",
    Colors.pink: "Pink",
  };

  Color selectedColor = Colors.blue; // Default selected color
  String selectedColorName = "Blue";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the selected color name
        Text(
          "Selected Color: $selectedColorName",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        // Display the colors
        Row(
          children: colorNames.entries.map((entry) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = entry.key; // Update the selected color
                  selectedColorName = entry.value; // Update the selected color name
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: entry.key, // Display the color
                  child: selectedColor == entry.key
                      ? Icon(Icons.check, color: Colors.white, size: 16) // Highlight the selected color
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Color Selector")),
      body: Center(
        child: ColorSelector(),
      ),
    ),
  ));
}
