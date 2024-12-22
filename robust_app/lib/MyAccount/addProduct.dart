

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

// import '../Screens/myAccountPage.dart';
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
//   String _selectedSize = ""; // Initially empty to enforce selection
//   Color? _selectedColor; // Null by default to enforce selection

//   List<File> _imageFiles = [];
//   bool _isImage(String path) {
//     return path.toLowerCase().endsWith('.jpg') ||
//         path.toLowerCase().endsWith('.jpeg') ||
//         path.toLowerCase().endsWith('.png');
//   }

// // Show Snackbar for invalid file formats
//   void _showInvalidFormatSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }

// // Function to capture image using the camera
//   Future<void> takePicture() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

//     if (photo != null) {
//       _imageFiles.add(File(photo.path));
//       setState(() {});
//     } else {
//       print("Camera capture cancelled");
//     }
//   }

// // Function to pick images
//   Future<void> pickImages() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowMultiple: true,
//       allowedExtensions: ['jpg', 'jpeg', 'png'], // Image formats
//     );

//     if (result != null) {
//       for (var file in result.files) {
//         if (_isImage(file.path!)) {
//           _imageFiles.add(File(file.path!));
//         } else {
//           _showInvalidFormatSnackbar(
//               "Please select a valid image file (jpg, jpeg, png).");
//         }
//       }
//       setState(() {});
//     } else {
//       print("Image picking cancelled");
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
//                 color: Colors.grey,
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
//                 Navigator.pop(context);
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
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AccountScreen()),
//                   );
//                 },
//                 child: const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/profile.jpg'),
//                 ),
//               ),
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
//                 _buildCategoryDropdown(),
//                 _buildTextField(
//                   controller: _nameController,
//                   label: "Enter Product Name*",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Product name cannot be empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 _buildTextField(
//                   controller: _priceController,
//                   label: "Enter Product Price*",
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     final price = int.tryParse(value ?? '');
//                     if (price == null || price < 1) {
//                       return 'Price must be at least 1';
//                     }
//                     return null;
//                   },
//                 ),
//                 _buildTextField(
//                   controller: _descriptionController,
//                   label: "Enter Product Description*",
//                   maxLines: 4,
//                   validator: (value) {
//                     if (value == null || value.trim().length < 10) {
//                       return 'Description must be at least 10 characters long';
//                     }
//                     return null;
//                   },
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
//                   child: Column(
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: pickImages,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                         ),
//                         icon: const Icon(Icons.image, color: Colors.white),
//                         label: const Text("Upload Images",
//                             style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 if (_imageFiles.isNotEmpty)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Selected Images:",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 8),
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: _imageFiles.map((file) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.file(
//                               file,
//                               height: 100,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 const SizedBox(height: 20),
               
               
//              ElevatedButton(
//   onPressed: () async {
//     if (_formKey.currentState!.validate()) {
//       if (_imageFiles.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Please add at least one image."),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       if (_selectedSize.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Please select a size."),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       if (_selectedColor == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Please select a color."),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       // Collect all data into a Product object
//       final product = Product(
//         category: _categoryController.text,
//         name: _nameController.text,
//         price: double.tryParse(_priceController.text) ?? 0.0,
//         discount: _discountController.text.isNotEmpty
//             ? double.tryParse(_discountController.text)
//             : null,
//         size: _selectedSize,
//         color: _selectedColor.toString(),
//         images: _imageFiles,
//         description: _descriptionController.text,
//       );
// showAddToCartSnackbar(context);
//       // Submit data to the server
//      // await _submitProduct(product);
//     }
//   },
//   style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.blue[900],
//     minimumSize: const Size(double.infinity, 50),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
//   child: const Text(
//     'Submit',
//     style: TextStyle(color: Colors.white, fontSize: 16),
//   ),
// ),

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
//     String? Function(String?)? validator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         validator: validator,
//       ),
//     );
//   }

//   Widget _buildCategoryDropdown() {
//     final categories = [
//       'Electronics',
//       'Clothing',
//       'Home Appliances',
//       'Books',
//       'Toys'
//     ];
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value:
//             _categoryController.text.isEmpty ? null : _categoryController.text,
//         decoration: InputDecoration(
//           labelText: "Select Product Category*",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         items: categories.map((category) {
//           return DropdownMenuItem<String>(
//             value: category,
//             child: Text(category),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             _categoryController.text = value!;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select a category';
//           }
//           return null;
//         },
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
//     Navigator.pop(context);
//     final snackBar = SnackBar(
//       content: const Text("Product added successfully"),
//       backgroundColor: const Color(0xFF1b447d),
//       duration: const Duration(seconds: 4),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
// class Product {
//   final String category;
//   final String name;
//   final double price;
//   final double? discount;
//   final String size;
//   final String color;
//   final List<File> images;
//   final String description;

//   Product({
//     required this.category,
//     required this.name,
//     required this.price,
//     this.discount,
//     required this.size,
//     required this.color,
//     required this.images,
//     required this.description,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'category': category,
//       'name': name,
//       'price': price,
//       'discount': discount,
//       'size': size,
//       'color': color,
//       'description': description,
//       // Convert image files to base64 strings or URIs for the API
//       'images': images.map((file) => file.path).toList(),
//     };
//   }
// }








// //code for submitting the product to the server

// // Future<void> _submitProduct(Product product) async {
// //   final url = Uri.parse('https://your-api-endpoint.com/products'); // Replace with your API URL

// //   try {
// //     final request = http.MultipartRequest('POST', url);

// //     // Add form fields
// //     request.fields.addAll(product.toJson());

// //     // Attach image files
// //     for (var imageFile in product.images) {
// //       request.files.add(await http.MultipartFile.fromPath(
// //         'images', // Replace with the key your API expects for images
// //         imageFile.path,
// //       ));
// //     }

// //     final response = await request.send();

// //     if (response.statusCode == 200) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Product added successfully!"),
// //           backgroundColor: Colors.green,
// //         ),
// //       );
// //       Navigator.pop(context);
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text("Failed to add product: ${response.reasonPhrase}"),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   } catch (e) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text("Error: $e"),
// //         backgroundColor: Colors.red,
// //       ),
// //     );
// //   }
// // }







import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

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
  final TextEditingController _bulletPointsController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _fullDetailsController = TextEditingController();
  final TextEditingController _itemInsideBoxController = TextEditingController();
  final TextEditingController _priceAfterDiscountController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();

  String _selectedSize = "";
  Color? _selectedColor;
  List<File> _imageFiles = [];
  List<String> categorySuggestions = [];
  List<String> brandSuggestions = [];
  Map<String, String> _additionalInformation = {};
   TextEditingController categorySearchController = TextEditingController();
   TextEditingController brandSearchController = TextEditingController();
     final List<Map<String, String>> products = [
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
    {
      'image': 'assets/product1.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 43,931',
      'rating': '4'
    },
    {
      'image': 'assets/product2.jpg',
      'title': 'Samsung X6 LTE',
      'price': 'Rs 81,104',
      'rating': '3'
    },
    {
      'image': 'assets/product3.png',
      'title': 'Robot Vacuum',
      'price': 'Rs 65,521',
      'rating': '2'
    },
    {
      'image': 'assets/product4.png',
      'title': '2-Door Refrigerator',
      'price': 'Rs 1,70,169',
      'rating': '1'
    },
    {
      'image': 'assets/product5.png',
      'title': 'Air Purifier',
      'price': 'Rs 66,235',
      'rating': '5'
    },
    {
      'image': 'assets/product6.png',
      'title': 'Portable Projector',
      'price': 'Rs 54,069',
      'rating': '3'
    },
  ];
     void updateCategorySuggestions(String query) {
    setState(() {
      if (query.length < 2) {
        categorySuggestions = [];
        
        return;
      }
      categorySuggestions = query.isEmpty
          ? []
          : products
              .map((product) => product['title']!)
              .where(
                  (title) => title.toLowerCase().contains(query.toLowerCase()))
              .take(3)
              .toList();
    });
  }

       void updateBrandSuggestions(String query) {
    setState(() {
      if (query.length < 2) {
        brandSuggestions = [];
        
        return;
      }
      brandSuggestions = query.isEmpty
          ? []
          : products
              .map((product) => product['title']!)
              .where(
                  (title) => title.toLowerCase().contains(query.toLowerCase()))
              .take(3)
              .toList();
    });
  }

   void clearCategorySearch() {
    setState(() {
      categorySearchController.clear();
      
      categorySuggestions.clear();
    });
  }

     void clearBrandSearch() {
    setState(() {
      brandSearchController.clear();
      
      brandSuggestions.clear();
    });
  }

  bool _isImage(String path) {
    return path.toLowerCase().endsWith('.jpg') ||
        path.toLowerCase().endsWith('.jpeg') ||
        path.toLowerCase().endsWith('.png');
  }

  Future<void> pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      for (var file in result.files) {
        if (_isImage(file.path!)) {
          _imageFiles.add(File(file.path!));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please select valid image files."),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
      setState(() {});
    }
  }

  Future<void> _showAdditionalInformationDialog() async {
    final TextEditingController keyController = TextEditingController();
    final TextEditingController valueController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Additional Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: keyController,
                decoration: const InputDecoration(labelText: "Key"),
              ),
              TextField(
                controller: valueController,
                decoration: const InputDecoration(labelText: "Value"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (keyController.text.isNotEmpty && valueController.text.isNotEmpty) {
                  setState(() {
                    _additionalInformation[keyController.text] = valueController.text;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    TextField(
                    controller: categorySearchController,
                    onChanged: updateCategorySuggestions,
                    decoration: InputDecoration(
                      labelText: 'Product Category',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: categorySearchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: clearCategorySearch,
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical:
                            10, // Adjust vertical padding to reduce height
                        horizontal: 12, // Adjust horizontal padding for spacing
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14, // Adjust the font size of the text
                    ),
                  ),

                      // Conditional rendering of suggestions
                  if (categorySuggestions.isNotEmpty )
                    Card(
                      margin: EdgeInsets.zero, // Removed extra margins
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // Make it as small as needed
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.zero, // Removed ListView padding
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categorySuggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true, // Reduce ListTile height
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8.0), // Minimized padding
                                title: Text(
                                  categorySuggestions[index],
                                  style: const TextStyle(
                                      fontSize: 14), // Smaller font size
                                ),
                                onTap: () {
                                  categorySearchController.text = categorySuggestions[index];
                                 // filterProducts(suggestions[index]);
                                  setState(() {
                                    categorySuggestions.clear();
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
             // ProductCategorySearch(),
                _buildTextField(
                  controller: _nameController,
                  label: "Enter Product Name*",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Product name is required';
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  controller: _priceController,
                  label: "Enter Product Price*",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Valid price is required';
                    }
                    return null;
                  },
                ),
    TextField(
                    controller: brandSearchController,
                    onChanged: updateBrandSuggestions,
                    decoration: InputDecoration(
                      labelText: 'Brand Name',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: brandSearchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: clearBrandSearch,
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical:
                            10, // Adjust vertical padding to reduce height
                        horizontal: 12, // Adjust horizontal padding for spacing
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14, // Adjust the font size of the text
                    ),
                  ),

                      // Conditional rendering of suggestions
                  if (brandSuggestions.isNotEmpty )
                    Card(
                      margin: EdgeInsets.zero, // Removed extra margins
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // Make it as small as needed
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.zero, // Removed ListView padding
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: brandSuggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true, // Reduce ListTile height
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8.0), // Minimized padding
                                title: Text(
                                  brandSuggestions[index],
                                  style: const TextStyle(
                                      fontSize: 14), // Smaller font size
                                ),
                                onTap: () {
                                  brandSearchController.text = brandSuggestions[index];
                                 // filterProducts(suggestions[index]);
                                  setState(() {
                                    brandSuggestions.clear();
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                     _buildTextField(
                  controller: _skuController,
                  label: "SKU",
                   validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "SKU Can't be null";
                    }
                    return null;
                  },
                ),


                _buildTextField(
                  controller: _bulletPointsController,
                  label: "Product Details (Bullet Points)*",
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Bullet points are required';
                    }
                    return null;
                  },
                ),
              
                _buildTextField(
                  controller: _fullDetailsController,
                  label: "Full Product Details*",
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Full product details are required';
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  controller: _itemInsideBoxController,
                  label: "Items Inside Box (Optional)",
                ),
                _buildTextField(
                  controller: _priceAfterDiscountController,
                  label: "Price After Discount (Optional)",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                const Text("Select available Sizes*", style: TextStyle(fontWeight: FontWeight.bold)),
                _buildSizeSelector(),
                const SizedBox(height: 10),
                const Text("Select available Colors*", style: TextStyle(fontWeight: FontWeight.bold)),
                _buildColorSelector(),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: pickImages,
                  child: const Text("Upload Images"),
                ),
                if (_imageFiles.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text("Selected Images:"),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: _imageFiles.map((file) => Image.file(file, height: 100, width: 100)).toList(),
                  ),
                ],
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showAdditionalInformationDialog,
                  child: const Text("Additional Information"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _imageFiles.isNotEmpty && _selectedSize.isNotEmpty && _selectedColor != null  ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Product added successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all required fields."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
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
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

 

  Widget _buildSizeSelector() {
    const sizes = ['XS', 'S', 'M', 'L', 'XL'];
    return Wrap(
      spacing: 8.0,
      children: sizes.map((size) => ChoiceChip(
        label: Text(size),
        selected: _selectedSize == size,
        onSelected: (selected) => setState(() => _selectedSize = size),
      )).toList(),
    );
  }

  Widget _buildColorSelector() {
    final colors = [Colors.pink, Colors.orange, Colors.green, Colors.blue, Colors.purple, Colors.black];
    return Wrap(
      spacing: 8.0,
      children: colors.map((color) => GestureDetector(
        onTap: () => setState(() => _selectedColor = color),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: _selectedColor == color ? Colors.blue : Colors.transparent,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
      )).toList(),
    );
  }
}

