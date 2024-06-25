import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../globalvars/globalvars.dart';

class Database {
  //ip for emulator 10.0.2.2
  String ip = "192.168.1.29";
  //String ip = '10.0.2.2';

  // Http post request to enroll the student
  Future enrollStudent({required File file,required String filename}) async {

    var url = Uri.http(ip, "atienrollmentsystemapi/enroll.php");
    //var url = Uri.http("${Env.URL_PREFIX}/enroll.php");
    //http.MultipartRequest()
    var request = http.MultipartRequest(
      'POST', url,

    );
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image','jpeg'),
      ),
    );
    request.fields.addAll({
      "gradeLevelToEnroll": gradeLevelToEnroll,
      "withLrn": withLrn,
      "balikAral": balikAral,
      "psaBirthCertNo": psaBirthCertNo,
      "lrn": lrn,
      "lastName": lastName,
      "firstName": firstName,
      "middleName": middleName,
      "extensionName": extensionName,
      "birthDate": birthDate,
      "pRegion": pRegion,
      "pProvince": pProvince,
      "pMunicipality": pMunicipality,
      "gender": gender,
      "age": age,
      "motherTongue": motherTongue,
      "indigenousPeople": indigenousPeople,
      "fourPsBeneficiary": fourPsBeneficiary,
      "cRegion": cRegion,
      "cProvince": cProvince,
      "cMunicipality": cMunicipality,
      "cBarangay": cBarangay,
      "cZipCode": cZipCode,
      "cStreetName": cStreetName,
      "cHouseNoStreet": cHouseNoStreet,
      "sameWithCurrentAddress": sameWithCurrentAddress,
      "perRegion": perRegion,
      "perProvince": perProvince,
      "perMunicipality": perMunicipality,
      "perBarangay": perBarangay,
      "perZipCode": perZipCode,
      "perStreetName": perStreetName,
      "perHouseNoStreet": perHouseNoStreet,
      "fatherLastName": fatherLastName,
      "fatherFirstName": fatherFirstName,
      "fatherMiddleName": fatherMiddleName,
      "fatherContactNum": fatherContactNum,
      "motherLastName": motherLastName,
      "motherFirstName": motherFirstName,
      "motherMiddleName": motherMiddleName,
      "motherContactNum": motherContactNum,
      "lastGradeLevelCompleted": lastGradeLevelCompleted,
      "lastSchoolYearCompleted": lastSchoolYearCompleted,
      "lastSchoolAttended": lastSchoolAttended,
      "lastSchoolID": lastSchoolID,
      "semester": semester,
      "track": track,
      "strand": strand,
      "email": email,
      "schoolYear": schoolYear,
    });
    print("request: "+request.toString());
    var res = await request.send();
    print("This is response:"+res.toString());
    return res.statusCode;
    return await http.post(
      url,
      body: {
        "gradeLevelToEnroll": gradeLevelToEnroll,
        "withLrn": withLrn,
        "balikAral": balikAral,
        "psaBirthCertNo": psaBirthCertNo,
        "lrn": lrn,
        "lastName": lastName,
        "firstName": firstName,
        "middleName": middleName,
        "extensionName": extensionName,
        "birthDate": birthDate,
        "pRegion": pRegion,
        "pProvince": pProvince,
        "pMunicipality": pMunicipality,
        "gender": gender,
        "age": age,
        "motherTongue": motherTongue,
        "indigenousPeople": indigenousPeople,
        "fourPsBeneficiary": fourPsBeneficiary,
        "cRegion": cRegion,
        "cProvince": cProvince,
        "cMunicipality": cMunicipality,
        "cBarangay": cBarangay,
        "cZipCode": cZipCode,
        "cStreetName": cStreetName,
        "cHouseNoStreet": cHouseNoStreet,
        "sameWithCurrentAddress": sameWithCurrentAddress,
        "perRegion": perRegion,
        "perProvince": perProvince,
        "perMunicipality": perMunicipality,
        "perBarangay": perBarangay,
        "perZipCode": perZipCode,
        "perStreetName": perStreetName,
        "perHouseNoStreet": perHouseNoStreet,
        "fatherLastName": fatherLastName,
        "fatherFirstName": fatherFirstName,
        "fatherMiddleName": fatherMiddleName,
        "fatherContactNum": fatherContactNum,
        "motherLastName": motherLastName,
        "motherFirstName": motherFirstName,
        "motherMiddleName": motherMiddleName,
        "motherContactNum": motherContactNum,
        "lastGradeLevelCompleted": lastGradeLevelCompleted,
        "lastSchoolYearCompleted": lastSchoolYearCompleted,
        "lastSchoolAttended": lastSchoolAttended,
        "lastSchoolID": lastSchoolID,
        "semester": semester,
        "track": track,
        "strand": strand,
        "email": email,
        "schoolYear": schoolYear,
      },
    );
  }


  Future checkEmailIfUsed(email) async {
    var url = Uri.http(ip, "atienrollmentsystemapi/checkEmailIfUsed.php");
    return await http.post(
      url,
      body: {
        "checkEmailIfUsed" : email,
      }
    );
  }

}