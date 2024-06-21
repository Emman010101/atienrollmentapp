
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

//vars for enrollment
String email = '';
String schoolYear = '';
String gradeLevelToEnroll = '';
String withLrn = '';
String balikAral = '';
String psaBirthCertNo = '';
String lrn = '';
String lastName = '';
String firstName = '';
String middleName = '';
String extensionName = '';
String birthDate = '';
String pRegion = '';
String pProvince = '';
String pMunicipality = '';
String gender = '';
String age = '';
String motherTongue = '';
String indigenousPeople = '';
String fourPsBeneficiary = '';
String cRegion = '';
String cProvince = '';
String cMunicipality = '';
String cBarangay = '';
String cZipCode = '';
String cStreetName = '';
String cHouseNoStreet = '';
String sameWithCurrentAddress = '';
String perRegion = '';
String perProvince = '';
String perMunicipality = '';
String perBarangay = '';
String perZipCode = '';
String perStreetName = '';
String perHouseNoStreet = '';
String fatherLastName = '';
String fatherFirstName = '';
String fatherMiddleName = '';
String fatherContactNum = '';
String motherLastName = '';
String motherFirstName = '';
String motherMiddleName = '';
String motherContactNum = '';
String lastGradeLevelCompleted = '';
String lastSchoolYearCompleted = '';
String lastSchoolAttended = '';
String lastSchoolID = '';
String semester = '';
String track = '';
String strand = '';