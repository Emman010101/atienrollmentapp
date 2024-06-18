import 'dart:io';

import 'package:atienrollmentapp/globalvars/globalvars.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Imagetools {

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? inputImageFromCameraImage(CameraImage image) {
    final camera = cameras[0];
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;
    //print("Sensor orientation: $sensorOrientation");
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
      _orientations[controller.value.deviceOrientation];
      //print("Rotation compensation: $rotationCompensation");
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (image.planes.isEmpty) return null;
    final plane = image.planes[0];

    // headrotx += "Image Size: width: " +
    //     image.width.toString() +
    //     " height: " +
    //     image.height.toString();

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: convertCameraImageToNV21(image),
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: InputImageFormat.nv21, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

// Define a function to convert CameraImage (YUV420_888) to NV21
  Uint8List convertCameraImageToNV21(CameraImage image) {
    int width = image.width;
    int height = image.height;

    // Extract Y, U, and V planes
    Plane planeY = image.planes[0];
    Plane planeU = image.planes[1];
    Plane planeV = image.planes[2];

    // Convert planes to Uint8List
    Uint8List yPlane = planeY.bytes;
    Uint8List uPlane = planeU.bytes;
    Uint8List vPlane = planeV.bytes;

    // Step 2: Interleave UV planes
    Uint8List uvInterleaved =
    Uint8List(planeU.bytes.length + planeV.bytes.length);
    int uvIndex = 0;
    for (int i = 0; i < height; i += 2) {
      for (int j = 0; j < width; j += 2) {
        uvInterleaved[uvIndex++] = uPlane[i * width ~/ 2 + j ~/ 2];
        uvInterleaved[uvIndex++] = vPlane[i * width ~/ 2 + j ~/ 2];
      }
    }

    // Step 3: Combine Y and UV planes
    Uint8List nv21Data = Uint8List(planeY.bytes.length + uvInterleaved.length);
    nv21Data.setRange(0, planeY.bytes.length, yPlane);
    nv21Data.setRange(planeY.bytes.length, nv21Data.length, uvInterleaved);

    return nv21Data;
  }
}