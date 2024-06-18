
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../classes/painter.dart';

late List<CameraDescription> cameras;
final CameraController controller = CameraController(
  cameras[0],
  ResolutionPreset.ultraHigh,
  enableAudio: false,
  imageFormatGroup: ImageFormatGroup.nv21,
);
final options = FaceDetectorOptions(enableLandmarks: true);
final faceDetector = FaceDetector(options: options);
var boundingBoxSize = "";
var inputImage;
var informer = '';
bool isDetecting = false;
//basePercentage is from ((bottom - top) / screenHeight)
// bottom and top is from bounding box
var basePercentage = 0.43366734693877;
Painter painter = Painter();
bool allowTakePic = false;
bool noseInCenter = false;
bool faceIsInFrame = false;