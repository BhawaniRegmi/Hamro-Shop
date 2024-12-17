import 'package:flutter/material.dart';

class AddShippingAddressScreen extends StatefulWidget {
  @override
  _AddShippingAddressScreenState createState() =>
      _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {
  String addressCategory = "Home"; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Shipping Address',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Recipient\'s Name', 'Input the real name'),
              SizedBox(height: 10),
              _buildTextField('Phone Number', 'Please input Phone Number'),
              SizedBox(height: 10),
              _buildTextField(
                  'City / District', 'Please input City / District'),
              SizedBox(height: 10),
              _buildTextField('Address', 'House no./building/street/area'),
              SizedBox(height: 10),
              _buildTextField('Landmark (optional)', 'Add Additional info'),
              SizedBox(height: 20),
              Text(
                'Address Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  _buildRadioButton('Home'),
                  SizedBox(width: 10),
                  _buildRadioButton('Office'),
                ],
              ),
              SizedBox(height: 20), // Space above the button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(backgroundColor: Color(0xFF1b447d),
                        content: SizedBox(height: 50,
                          child: Text('Shipping address saved successfully')),
                        duration: Duration(seconds: 3),
                      )
                    );
                  },
                  child: Text('Save',style: TextStyle(color: Colors.white, ),),
                  style: ElevatedButton.styleFrom(backgroundColor:  Color(0xFF1b447d),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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

  Widget _buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: addressCategory,
          onChanged: (String? newValue) {
            setState(() {
              addressCategory = newValue!;
            });
          },
        ),
        Text(value),
      ],
    );
  }
}
