// import 'package:flutter/material.dart';

// class FilterDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Tabs (Sale, Trending, New)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildTab('Sale'),
//                 _buildTab('Trending'),
//                 _buildTab('New'),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Category
//             const Text(
//               'Category',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               children: [
//                 _buildFilterChip('All'),
//                 _buildFilterChip('Best Match'),
//                 _buildFilterChip('Top Sales'),
//                 _buildFilterChip('Free Delivery'),
//                 _buildFilterChip('Discount'),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Price
//             const Text(
//               'Price:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Min Rs',
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Max Rs',
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Rating
//             const Text(
//               'Rating',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(
//                 5,
//                 (index) => IconButton(
//                   onPressed: () {},
//                   icon: Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber),
//                       Text('${5 - index}'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Brands
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Brands',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text('View all'),
//                 ),
//               ],
//             ),
//             Wrap(
//               spacing: 8,
//               children: [
//                 _buildFilterChip('Dell'),
//                 _buildFilterChip('Puma'),
//                 _buildFilterChip('Zara'),
//                 _buildFilterChip('Xiaomi'),
//                 _buildFilterChip('Bagmati'),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Color
//             const Text(
//               'Color',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildColorCircle(Colors.orange),
//                 _buildColorCircle(Colors.pink),
//                 _buildColorCircle(Colors.blue),
//                 _buildColorCircle(Colors.purple),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Size
//             const Text(
//               'Size',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: ['XS', 'S', 'M', 'L', 'XL']
//                   .map((size) => OutlinedButton(
//                         onPressed: () {},
//                         child: Text(size),
//                       ))
//                   .toList(),
//             ),
//             const Spacer(),

//             // Reset and Done Buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Reset logic
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                     ),
//                     child: const Text('Reset'),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Done logic
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                     child: const Text('Done'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTab(String text) {
//     return TextButton(
//       onPressed: () {},
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         backgroundColor: Colors.grey[200],
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label) {
//     return Chip(
//       label: Text(label),
//       backgroundColor: Colors.grey[200],
//     );
//   }

//   Widget _buildColorCircle(Color color) {
//     return Container(
//       width: 24,
//       height: 24,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.black26),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
   final Function(double minPrice, double maxPrice) onPriceRangeChanged;
  final Function(int rating) onRatingChanged;

  FilterDrawer({
    required this.onPriceRangeChanged,
    required this.onRatingChanged,
  });
  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
    final TextEditingController minPriceController = TextEditingController();

  final TextEditingController maxPriceController = TextEditingController();

  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              // Tabs (Sale, Trending, New)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('Sale'),
                  _buildTab('Trending'),
                  _buildTab('New'),
                ],
              ),
             // const SizedBox(height: 20),

              // Category
              const Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('All'),
                  _buildFilterChip('Best Match'),
                  _buildFilterChip('Top Sales'),
                  _buildFilterChip('Free Delivery'),
                  _buildFilterChip('Discount'),
                ],
              ),
             // const SizedBox(height: 20),

              // Price
              const Text(
                'Price:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8,),
               const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: minPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Min Rs',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: maxPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Max Rs',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Get the price range values
                      double minPrice =
                          double.tryParse(minPriceController.text) ?? 0;
                      double maxPrice =
                          double.tryParse(maxPriceController.text) ??
                              double.infinity;

                      // Trigger the callback to update the parent state
                      widget.onPriceRangeChanged(minPrice, maxPrice);

                      // Optionally close the drawer
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Rating:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        selectedRating = 5 - index; // Update selected rating
                      });
                      widget.onRatingChanged(
                          selectedRating); // Notify parent (SearchScreen)
                          Navigator.pop(context);
                    },
                    icon: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text('${5 - index}'),
                      ],
                    ),
                  ),
                ),
              ),

              // Brands
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Brands',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all'),
                  ),
                ],
              ),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('Dell'),
                  _buildFilterChip('Puma'),
                  _buildFilterChip('Zara'),
                  _buildFilterChip('Xiaomi'),
                  _buildFilterChip('Bagmati'),
                ],
              ),
             // const SizedBox(height: 20),

              // Color
              const Text(
                'Color',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildColorCircle(Colors.orange),
                  _buildColorCircle(Colors.pink),
                  _buildColorCircle(Colors.blue),
                  _buildColorCircle(Colors.purple),
                ],
              ),
              const SizedBox(height: 8),

              // Size
              const Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 6),
             SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: ['XS', 'S', 'M', 'L', 'XL']
        .map((size) => Padding(
              padding: const EdgeInsets.only(right: 8.0), // Optional: for spacing between buttons
              child: OutlinedButton(
                onPressed: () {},
                child: Text(size),
              ),
            ))
        .toList(),
  ),
),

             // const SizedBox(height: 20),

              // Reset and Done Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Reset logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Done logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
    );
  }
}









// import 'package:flutter/material.dart';

// class FilterDrawer extends StatefulWidget {
//   final Function(double minPrice, double maxPrice) onPriceRangeChanged;
//   final Function(int rating) onRatingChanged;

//   FilterDrawer({
//     required this.onPriceRangeChanged,
//     required this.onRatingChanged,
//   });

//   @override
//   _FilterDrawerState createState() => _FilterDrawerState();
// }

// class _FilterDrawerState extends State<FilterDrawer> {
//   final TextEditingController minPriceController = TextEditingController();
//   final TextEditingController maxPriceController = TextEditingController();
//   int selectedRating = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildTab('Sale'),
//                   _buildTab('Trending'),
//                   _buildTab('New'),
//                 ],
//               ),
//               const Text(
//                 'Category',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               const SizedBox(height: 4),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   _buildFilterChip('All'),
//                   _buildFilterChip('Best Match'),
//                   _buildFilterChip('Top Sales'),
//                   _buildFilterChip('Free Delivery'),
//                   _buildFilterChip('Discount'),
//                 ],
//               ),
//               const Text(
//                 'Price:',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       child: TextField(
//                         controller: minPriceController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           hintText: 'Min Rs',
//                           border: OutlineInputBorder(),
//                           isDense: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       child: TextField(
//                         controller: maxPriceController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           hintText: 'Max Rs',
//                           border: OutlineInputBorder(),
//                           isDense: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.search),
//                     onPressed: () {
//                       // Get the price range values
//                       double minPrice =
//                           double.tryParse(minPriceController.text) ?? 0;
//                       double maxPrice =
//                           double.tryParse(maxPriceController.text) ??
//                               double.infinity;

//                       // Trigger the callback to update the parent state
//                       widget.onPriceRangeChanged(minPrice, maxPrice);

//                       // Optionally close the drawer
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Rating:',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: List.generate(
//                   5,
//                   (index) => IconButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedRating = 5 - index; // Update selected rating
//                       });
//                       widget.onRatingChanged(
//                           selectedRating); // Notify parent (SearchScreen)
//                           Navigator.pop(context);
//                     },
//                     icon: Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber),
//                         Text('${5 - index}'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),




//               // ... Remaining UI components (Brands, Colors, Size, etc.)
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Reset filters
//                         minPriceController.clear();
//                         maxPriceController.clear();
//                         widget.onPriceRangeChanged(0, double.infinity);
//                         widget.onRatingChanged(0);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                       child: const Text('Reset'),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         double minPrice =
//                             double.tryParse(minPriceController.text) ?? 0;
//                         double maxPrice =
//                             double.tryParse(maxPriceController.text) ??
//                                 double.infinity;
//                         widget.onPriceRangeChanged(minPrice, maxPrice);
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                       ),
//                       child: const Text('Done'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTab(String text) {
//     return TextButton(
//       onPressed: () {},
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         backgroundColor: Colors.grey[200],
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label) {
//     return Chip(
//       label: Text(label),
//       backgroundColor: Colors.grey[200],
//     );
//   }
// }
