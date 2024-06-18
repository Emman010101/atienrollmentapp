


import 'dart:math';

import 'package:atienrollmentapp/screen/displaypic.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:wakelock/wakelock.dart';

import '../classes/imagetools.dart';
import '../globalvars/globalvars.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    controller.initialize().then((_) async {
      if (!mounted) {
        return;
      }
      setState(() {});
      await controller.startImageStream((CameraImage image) async {
        //print("Type of image: $image");
        painter.setStreamImageSize = Size(image.width.toDouble(), image.height.toDouble());
        if (isDetecting) return;
        isDetecting = true;
        inputImage = Imagetools().inputImageFromCameraImage(image);
        //print("inputImage: " + image.planes[0].bytes.toString().substring(0,200));

        if(noseInCenter && faceIsInFrame){
          allowTakePic = true;
        }else{
          allowTakePic = false;
        }

        if (true) {
          final List<Face> faces = await faceDetector.processImage(inputImage!);

          if(faces.isEmpty){
            painter.setBoundingBoxRect = Rect.zero;
            painter.setNosePos = const Point(0,0);
          }

          for (Face face in faces) {
            final Rect boundingBox = face.boundingBox;

            painter.setBoundingBoxRect = boundingBox;

            //get the required bounding box size by multiplying screen size by the base percentage
            var requiredBoundingBoxSize = painter.getScreenSize.height * basePercentage;

            try{
              //informer = "Bounding Box: $bounding ";
              int num = 10;
              informer = "";
              //informer = "Bounding Box Diff: $boundingBoxDiff";

              ///////conditions to determine the distance between the face and sensor
              if(!(painter.getBoundingBoxDiff >= (requiredBoundingBoxSize - num) && painter.getBoundingBoxDiff <= (requiredBoundingBoxSize + num))){
                if(painter.getBoundingBoxDiff < (requiredBoundingBoxSize - num)){
                  informer += "Your face is too far from the frame.";
                  painter.setFrameColor = Colors.red;
                  faceIsInFrame = false;
                }else{
                  informer += "Your face is too close to the frame.";
                  painter.setFrameColor = Colors.red;
                  faceIsInFrame = false;
                }
              }else{
                // informer += "Perfect! ";
                // informer += "Now align the + inside the small circle";
                painter.setFrameColor = Colors.green;
                faceIsInFrame = true;
              }
            }catch(e){
              informer = "Error";
            }

            //print("BoundingBox: " + bounding.toString());

            final double rotX =
                face.headEulerAngleX ?? 0; // Head is tilted up and down rotX degrees
            final double rotY = face
                .headEulerAngleY ?? 0; // Head is rotated to the right rotY degrees
            final double? rotZ =
                face.headEulerAngleZ; // Head is tilted sideways rotZ degrees

            int allowedTilt = 4;
            if(!((rotX > -allowedTilt && rotX < allowedTilt) && (rotY > -allowedTilt && rotY < allowedTilt))){
              informer = "Please make sure that you are looking straight to the camera.";
            }

            //informer = rotX.toString();
            //informer = "Bounding Box: $bounding";
            //informer += " up/down: $rotX r/l: $rotY";

            //boundingBoxSize = boundingBox as String;

            // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
            // eyes, cheeks, and nose available):
            final FaceLandmark? leftEar =
            face.landmarks[FaceLandmarkType.leftEar];
            if (leftEar != null) {
              final Point<int> leftEarPos = leftEar.position;
            }

            final FaceLandmark? nose =
            face.landmarks[FaceLandmarkType.noseBase];
            if (nose != null) {
              painter.setNosePos = nose.position;
            }

            //nosePos = nosePos.x;
            //print("head rotation x: $rotX, nosepos: $nosePos");

            //informer += nosePos;

            // If classification was enabled with FaceDetectorOptions:
            if (face.smilingProbability != null) {
              final double? smileProb = face.smilingProbability;
            }

            // If face tracking was enabled with FaceDetectorOptions:
            if (face.trackingId != null) {
              final int? id = face.trackingId;
            }
          }
        }
        isDetecting = false;
        setState(() {});
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }


  void _onTap(BuildContext context) async {
    //allowTakePic
    if(allowTakePic){
      final image = await controller.takePicture();

      // If the picture was taken, display it on a new screen.
      if (!context.mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
          ),
        ),
      );
    }
    print("Screen Is Tapped");
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var msize = "Height: ${screenSize.height} Width: ${screenSize.width}";
    print("MediaQuery $msize");
    if (!controller.value.isInitialized) {
      return Container();
    }
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Scaffold(
            body: GestureDetector(
              onTap: (){
                _onTap(context);
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: constraint.maxWidth,
                    height: constraint.maxHeight,
                    child: CameraPreview(controller),
                  ),
                  CustomPaint(
                    painter: painter,
                    size: Size(constraint.maxWidth, constraint.maxHeight),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(informer, style: const TextStyle(color: Colors.green, fontSize: 20),),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/face_frame.png',
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    child: const Center(
                      child: Text("+", style: TextStyle(color: Colors.green, fontSize: 20),textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}