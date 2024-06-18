import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.2, vertical: 30),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Icon(FontAwesomeIcons.x),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              child: const Icon(FontAwesomeIcons.check),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}