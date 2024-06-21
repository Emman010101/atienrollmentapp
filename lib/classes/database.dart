import 'package:http/http.dart' as http;

import '../globalvars/globalvars.dart';

class Database {
  //ip for emulator 10.0.2.2
  var url = Uri.http("10.0.2.2", "atienrollmentsystemapi/enroll.php");
  //var url = Uri.http("${Env.URL_PREFIX}/enroll.php");
  // Http post request to enroll the student
  Future enrollStudent() async {
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
}