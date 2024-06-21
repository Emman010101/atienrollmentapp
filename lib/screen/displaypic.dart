import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../classes/database.dart';
import '../functions/snackbar.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isLoading = false;
    Database db = Database();

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
            //check button
            FloatingActionButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  var enroll = await db.enrollStudent();

                  // JSON string
                  String jsonString =
                  enroll.body.toString();

                  print("JSON BODY: $jsonString");

                  // Decode JSON string
                  Map<String, dynamic> jsonObject =
                  jsonDecode(jsonString);

                  // Access the value
                  bool success = jsonObject['success'];

                  // Print the value
                  print('Success: $success');
                  //print("Student Enrolled!!!" + enroll);
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  print("Error $e");
                  snackBar(context,
                      'Something went wrong. Please check your internet connection.');
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              backgroundColor: Colors.green,
              child: const Icon(FontAwesomeIcons.check),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      // body: Image.file(File(widget.imagePath)),
      body: Stack(
        children: [
          Container(
            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            ) : SizedBox(),
          ),
          //Image.asset('assets/images/logo.png'),
          Image.file(File(widget.imagePath)),
        ],
      ),
    );
  }
}
