import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Screens/myAccountPage.dart';
import '../Screens/myCart.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  // List to hold selected images and videos
  List<File> _imageFiles = [];
  List<File> _videoFiles = [];
  List<VideoPlayerController> _videoControllers = [];

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

// Function to pick videos
Future<void> pickVideos() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: ['mp4'], // Video formats
  );

  if (result != null) {
    for (var file in result.files) {
      if (_isVideo(file.path!)) {
        File videoFile = File(file.path!);
        _videoFiles.add(videoFile);

        // Initialize video player controller for each video
        VideoPlayerController controller = VideoPlayerController.file(videoFile)
          ..initialize().then((_) {
            setState(() {});
          });
        _videoControllers.add(controller);
      } else {
        _showInvalidFormatSnackbar("Please select a valid video file (mp4).");
      }
    }
    setState(() {});
  } else {
    print("Video picking cancelled");
  }
}

// Helper to check if file is an image
bool _isImage(String path) {
  return path.toLowerCase().endsWith('.jpg') ||
         path.toLowerCase().endsWith('.jpeg') ||
         path.toLowerCase().endsWith('.png');
}

// Helper to check if file is a video
bool _isVideo(String path) {
  return path.toLowerCase().endsWith('.mp4');
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

  void showAddToCartSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Product Promotion done"), // Text message
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

  @override
  void dispose() {
    // Dispose all video controllers
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
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
                'Promotion',
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter Product Category*", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Category",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),

              const Text("Enter Product Name*", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Product Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 24),

              // Buttons for Uploading Images and Videos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: pickImages,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text("Upload Images", style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton.icon(
                    onPressed: pickVideos,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.video_file, color: Colors.white),
                    label: const Text("Upload Videos", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 16),

              // Section to Display Videos
              if (_videoFiles.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Selected Videos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Column(
                      children: _videoControllers.asMap().entries.map((entry) {
                        int index = entry.key;
                        VideoPlayerController controller = entry.value;

                        return Column(
                          children: [
                            AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: VideoPlayer(controller),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  controller.value.isPlaying ? controller.pause() : controller.play();
                                });
                              },
                              child: Text(controller.value.isPlaying ? "Pause" : "Play"),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
               

              const Text("Explain product and their features", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
            TextField(
  maxLines: 5,
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: "Product features",
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
),
              const SizedBox(height: 15),
                     ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
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
    );
  }
}
