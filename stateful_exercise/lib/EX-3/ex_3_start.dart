import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/w4-s2/bird.jpg",
  "lib/EX-3/w4-s2/bird2.jpg",
  "lib/EX-3/w4-s2/insect.jpg",
  "lib/EX-3/w4-s2/girl.jpg",
  "lib/EX-3/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManageImage(), 
    ));

class ManageImage extends StatefulWidget {
  const ManageImage({super.key});

  @override
  State<ManageImage> createState() => _ManageImageState();
}

class _ManageImageState extends State<ManageImage> {
  int currentIndex = 0;

  void nextImage() {
    setState(() {
      if (currentIndex == images.length - 1) {
        currentIndex = 0;
      }
      else {
        currentIndex++;
      }
    });
  }

  void previousImage() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      }
      else {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text(
          'Image Viewer',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Previous Image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next Image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(
        images[currentIndex],
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
