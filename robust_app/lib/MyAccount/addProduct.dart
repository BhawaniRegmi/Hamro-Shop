import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Screens/myCart.dart';

class ProductDetailsPageAdd extends StatefulWidget {
  @override
  _ProductDetailsPageAddState createState() => _ProductDetailsPageAddState();
}

class _ProductDetailsPageAddState extends State<ProductDetailsPageAdd> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Selected size and color
  String _selectedSize = "M";
  Color _selectedColor = Colors.black;

  // Camera and image handling
  CameraController? _cameraController;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }
  // CameraController? _cameraController;
  // XFile? _imageFile; // To store the captured image
@override
void dispose() {
  _cameraController?.dispose();
  _cameraController = null;
  super.dispose();
}

void showAddToCartSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Product added successfully"), // Text message
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


Future<void> _openCamera() async {
  if (_cameraController != null && _cameraController!.value.isInitialized) {
    print("Camera already initialized.");
    return; // Avoid reinitializing the camera
  }

  try {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController!.initialize();
      setState(() {});
    }
  } catch (e) {
    print("Error initializing camera: $e");
  }
}



Future<void> _captureImage() async {
  if (_cameraController == null || !_cameraController!.value.isInitialized) {
    print("Camera not initialized or already disposed.");
    return;
  }

  try {
    // Capture the image
    final image = await _cameraController!.takePicture();
    setState(() {
      _imageFile = image;
    });
  } catch (e) {
    print("Error capturing image: $e");
  }
}



  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
        await _cameraController!.initialize();
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _capturePhoto() async {
    try {
      if (_cameraController != null && _cameraController!.value.isInitialized) {
        final image = await _cameraController!.takePicture();
        setState(() {
          _imageFile = image;
        });
      } else {
        print("Camera is not initialized");
      }
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  // @override
  // void dispose() {
  //   _cameraController?.dispose();
  //   super.dispose();
  // }

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
               color:  Colors.grey,
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
                'Add Product',
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  controller: _categoryController,
                  label: "Enter Product Category*",
                ),
                _buildTextField(
                  controller: _nameController,
                  label: "Enter Product Name*",
                ),
                _buildTextField(
                  controller: _priceController,
                  label: "Enter Product Price*",
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  controller: _discountController,
                  label: "Any Discount? Enter discount percentage if any.",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Select available Sizes*",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildSizeSelector(),
                const SizedBox(height: 10),
                const Text(
                  "Select available Colors*",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 const SizedBox(height: 6),
                _buildColorSelector(),
                const SizedBox(height: 12),
                const Text(
                  "Add Product Images",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildCameraSection(),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _descriptionController,
                  label: "Enter Product description.",
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context); // Close the dialog
                    showAddToCartSnackbar(
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSizeSelector() {
    const sizes = ['XS', 'S', 'M', 'L', 'XL'];
    return Row(
      children: sizes
          .map((size) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(size),
                  selected: _selectedSize == size,
                  onSelected: (selected) {
                    setState(() {
                      _selectedSize = size;
                    });
                  },
                  selectedColor: Colors.blue[900],
                  labelStyle: TextStyle(
                    color: _selectedSize == size ? Colors.white : Colors.black,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildColorSelector() {
    final colors = [
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.black,
    ];
    return Row(
      children: colors
          .map((color) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: _selectedColor == color
                          ? Colors.blue[900]!
                          : Colors.transparent,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCameraSection() {
    return Column(
      children: [
         const SizedBox(height: 20),
              if (_cameraController != null && _cameraController!.value.isInitialized)
                Container(
                  height: 200,
                  width: double.infinity,
                  child: CameraPreview(_cameraController!),
                )
              else
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Center(child: Text("Camera Preview Here")),
                ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _captureImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    minimumSize: const Size(120, 50),
                  ),
                  child: const Text(
                    'Click Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _imageFile != null
                  ? Image.file(
                      File(_imageFile!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text("No image captured yet!"),
                    ),
      ],
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      print("Form submitted");
    }
  }
}
