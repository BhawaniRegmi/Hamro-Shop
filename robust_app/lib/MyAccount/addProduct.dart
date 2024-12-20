// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// import '../Screens/myCart.dart';

// class ProductDetailsPageAdd extends StatefulWidget {
//   @override
//   _ProductDetailsPageAddState createState() => _ProductDetailsPageAddState();
// }

// class _ProductDetailsPageAddState extends State<ProductDetailsPageAdd> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers for text fields
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _discountController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   // Selected size and color
//   String _selectedSize = "M";
//   Color _selectedColor = Colors.black;

//   File? _pickedImage;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _pickedImage = File(pickedFile.path);
//       });
//     } else {
//       // Show a snackbar if the user picks a non-image file
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please pick an image file, not a video or other type.'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               bottom: BorderSide(
//                // color: Colors.black,
//                color:  Colors.grey,
//                 width: 1,
//               ),
//             ),
//           ),
//           child: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {
//                Navigator.pop(context);
//               },
//             ),
//             title: const Center(
//               child: Text(
//                 'Added Product',
//                 style: TextStyle(
//                   color: Color(0xFF1b447d),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.shopping_cart, color: Colors.black),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyCartPage()),
//                   );
//                 },
//               ),
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage('assets/profile.jpg'),
//               ),

//              // const SizedBox(width: 16),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildTextField(
//                   controller: _categoryController,
//                   label: "Enter Product Category*",
//                 ),
//                 _buildTextField(
//                   controller: _nameController,
//                   label: "Enter Product Name*",
//                 ),
//                 _buildTextField(
//                   controller: _priceController,
//                   label: "Enter Product Price*",
//                   keyboardType: TextInputType.number,
//                 ),
//                 _buildTextField(
//                   controller: _discountController,
//                   label: "Any Discount? Enter discount percentage if any.",
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Select available Sizes*",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 _buildSizeSelector(),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Select available Colors*",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 6),
//                 _buildColorSelector(),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Add Product Images",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _pickImage,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green[700],
//                       minimumSize: const Size(120, 50),
//                     ),
//                     child: const Text(
//                       'Pick Image',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _pickedImage != null
//                     ? Image.file(
//                         _pickedImage!,
//                         width: 200,
//                         height: 200,
//                         fit: BoxFit.cover,
//                       )
//                     : const Center(
//                         child: Text("No image picked yet!"),
//                       ),
//                 const SizedBox(height: 20),
//                 _buildTextField(
//                   controller: _descriptionController,
//                   label: "Enter Product description.",
//                   maxLines: 4,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     showAddToCartSnackbar(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue[900],
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Submit',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSizeSelector() {
//     const sizes = ['XS', 'S', 'M', 'L', 'XL'];
//     return Row(
//       children: sizes
//           .map((size) => Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: ChoiceChip(
//                   label: Text(size),
//                   selected: _selectedSize == size,
//                   onSelected: (selected) {
//                     setState(() {
//                       _selectedSize = size;
//                     });
//                   },
//                   selectedColor: Colors.blue[900],
//                   labelStyle: TextStyle(
//                     color: _selectedSize == size ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ))
//           .toList(),
//     );
//   }

//   Widget _buildColorSelector() {
//     final colors = [
//       Colors.pink,
//       Colors.orange,
//       Colors.green,
//       Colors.blue,
//       Colors.purple,
//       Colors.black,
//     ];
//     return Row(
//       children: colors
//           .map((color) => GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedColor = color;
//                   });
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.only(right: 10),
//                   width: 32,
//                   height: 32,
//                   decoration: BoxDecoration(
//                     color: color,
//                     border: Border.all(
//                       color: _selectedColor == color
//                           ? Colors.blue[900]!
//                           : Colors.transparent,
//                       width: 2,
//                     ),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ))
//           .toList(),
//     );
//   }

//   void showAddToCartSnackbar(BuildContext context) {
//     final snackBar = SnackBar(
//       content: const Text("Product added successfully"),
//       backgroundColor: const Color(0xFF1b447d),
//       duration: const Duration(seconds: 4),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

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

  List<File> _imageFiles = [];
  bool _isImage(String path) {
  return path.toLowerCase().endsWith('.jpg') ||
         path.toLowerCase().endsWith('.jpeg') ||
         path.toLowerCase().endsWith('.png');
}

// Show Snackbar for invalid file formats
void _showInvalidFormatSnackbar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ),
  );
}

// Function to capture image using the camera
Future<void> takePicture() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  if (photo != null) {
    _imageFiles.add(File(photo.path));
    setState(() {});
  } else {
    print("Camera capture cancelled");
  }
}


// Function to pick images
Future<void> pickImages() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: ['jpg', 'jpeg', 'png'], // Image formats
  );

  if (result != null) {
    for (var file in result.files) {
      if (_isImage(file.path!)) {
        _imageFiles.add(File(file.path!));
      } else {
        _showInvalidFormatSnackbar("Please select a valid image file (jpg, jpeg, png).");
      }
    }
    setState(() {});
  } else {
    print("Image picking cancelled");
  }
}

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
                'Added Product',
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
                const SizedBox(height: 10),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: _pickImages,
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.green[700],
                //       minimumSize: const Size(120, 50),
                //     ),
                //     child: const Text(
                //       'Pick Images',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                // Center(
                //   child:     ElevatedButton.icon(
                //     onPressed: pickImages,
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blue,
                //     ),
                //     icon: const Icon(Icons.image, color: Colors.white),
                //     label: const Text("Upload Images", style: TextStyle(color: Colors.white)),
                //   ),
                // ),

                Center(
  child: Column(
    children: [
      ElevatedButton.icon(
        onPressed: pickImages,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        icon: const Icon(Icons.image, color: Colors.white),
        label: const Text("Upload Images", style: TextStyle(color: Colors.white)),
      ),
     // const SizedBox(height: 10),
      // ElevatedButton.icon(
      //   onPressed: takePicture,
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.green,
      //   ),
      //   icon: const Icon(Icons.camera, color: Colors.white),
      //   label: const Text("Take Picture", style: TextStyle(color: Colors.white)),
      // ),
    ],
  ),
),


                const SizedBox(height: 15),
                // _pickedImages.isNotEmpty
                //     ? Wrap(
                //         spacing: 10,
                //         runSpacing: 10,
                //         children: _pickedImages.map((image) {
                //           return Image.file(
                //             image,
                //             width: 100,
                //             height: 100,
                //             fit: BoxFit.cover,
                //           );
                //         }).toList(),
                //       )
                //     : const Center(
                //         child: Text("No images picked yet!"),
                //       ),
               

                  // Section to Display Images
              if (_imageFiles.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Selected Images:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _imageFiles.map((file) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            file,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                _buildTextField(
                  controller: _descriptionController,
                  label: "Enter Product description.",
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showAddToCartSnackbar(context);
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

  void showAddToCartSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text("Product added successfully"),
      backgroundColor: const Color(0xFF1b447d),
      duration: const Duration(seconds: 4),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
