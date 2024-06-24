import 'package:http/http.dart' as http;

import '../globalvars/globalvars.dart';

class Database {
  //ip for emulator 10.0.2.2
  //String ip = "192.168.1.29";
  String ip = '10.0.2.2';

  // Http post request to enroll the student
  Future enrollStudent() async {

    var url = Uri.http(ip, "atienrollmentsystemapi/enroll.php");
    //var url = Uri.http("${Env.URL_PREFIX}/enroll.php");
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