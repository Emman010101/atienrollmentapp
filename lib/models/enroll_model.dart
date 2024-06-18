class Enroll {
  final String gradeLevelToEnroll;
  final String withLrn;
  final String balikAral;
  final String psaBirthCertNo;
  final String lrn;
  final String lastName;
  final String firstName;
  final String middleName;
  final String extensionName;
  final String birthDate;
  final String pRegion;
  final String pProvince;
  final String pMunicipality;
  final String gender;
  final String age;
  final String motherTongue;
  final String indigenousPeople;
  final String fourPsBeneficiary;
  final String cRegion;
  final String cProvince;
  final String cMunicipality;
  final String cBarangay;
  final String cZipCode;
  final String cStreetName;
  final String cHouseNoStreet;
  final String sameWithCurrentAddress;
  final String perRegion;
  final String perProvince;
  final String perMunicipality;
  final String perBarangay;
  final String perZipCode;
  final String perStreetName;
  final String perHouseNoStreet;
  final String fatherLastName;
  final String fatherFirstName;
  final String fatherMiddleName;
  final String fatherContactNum;
  final String motherLastName;
  final String motherFirstName;
  final String motherMiddleName;
  final String motherContactNum;
  final String lastGradeLevelCompleted;
  final String lastSchoolYearCompleted;
  final String lastSchoolAttended;
  final String lastSchoolID;
  final String semester;
  final String track;
  final String strand;

  Enroll({
    required this.gradeLevelToEnroll,
    required this.withLrn,
    required this.balikAral,
    required this.psaBirthCertNo,
    required this.lrn,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.extensionName,
    required this.birthDate,
    required this.pRegion,
    required this.pProvince,
    required this.pMunicipality,
    required this.gender,
    required this.age,
    required this.motherTongue,
    required this.indigenousPeople,
    required this.fourPsBeneficiary,
    required this.cRegion,
    required this.cProvince,
    required this.cMunicipality,
    required this.cBarangay,
    required this.cZipCode,
    required this.cStreetName,
    required this.cHouseNoStreet,
    required this.sameWithCurrentAddress,
    required this.perRegion,
    required this.perProvince,
    required this.perMunicipality,
    required this.perBarangay,
    required this.perZipCode,
    required this.perStreetName,
    required this.perHouseNoStreet,
    required this.fatherLastName,
    required this.fatherFirstName,
    required this.fatherMiddleName,
    required this.fatherContactNum,
    required this.motherLastName,
    required this.motherFirstName,
    required this.motherMiddleName,
    required this.motherContactNum,
    required this.lastGradeLevelCompleted,
    required this.lastSchoolYearCompleted,
    required this.lastSchoolAttended,
    required this.lastSchoolID,
    required this.semester,
    required this.track,
    required this.strand,
  });

  factory Enroll.fromJson(Map<String, dynamic> json) {
    return Enroll(
      gradeLevelToEnroll: json['gradeLevelToEnroll'],
      withLrn: json['withLrn'],
      balikAral: json['balikAral'],
      psaBirthCertNo: json['psaBirthCertNo'],
      lrn: json['lrn'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      extensionName: json['extensionName'],
      birthDate: json['birthDate'],
      pRegion: json['pRegion'],
      pProvince: json['pProvince'],
      pMunicipality: json['pMunicipality'],
      gender: json['gender'],
      age: json['age'],
      motherTongue: json['motherTongue'],
      indigenousPeople: json['indigenousPeople'],
      fourPsBeneficiary: json['fourPsBeneficiary'],
      cRegion: json['cRegion'],
      cProvince: json['cProvince'],
      cMunicipality: json['cMunicipality'],
      cBarangay: json['cBarangay'],
      cZipCode: json['cZipCode'],
      cStreetName: json['cStreetName'],
      cHouseNoStreet: json['cHouseNoStreet'],
      sameWithCurrentAddress: json['sameWithCurrentAddress'],
      perRegion: json['perRegion'],
      perProvince: json['perProvince'],
      perMunicipality: json['perMunicipality'],
      perBarangay: json['perBarangay'],
      perZipCode: json['perZipCode'],
      perStreetName: json['perStreetName'],
      perHouseNoStreet: json['perHouseNoStreet'],
      fatherLastName: json['fatherLastName'],
      fatherFirstName: json['fatherFirstName'],
      fatherMiddleName: json['fatherMiddleName'],
      fatherContactNum: json['fatherContactNum'],
      motherLastName: json['motherLastName'],
      motherFirstName: json['motherFirstName'],
      motherMiddleName: json['motherMiddleName'],
      motherContactNum: json['motherContactNum'],
      lastGradeLevelCompleted: json['lastGradeLevelCompleted'],
      lastSchoolYearCompleted: json['lastSchoolYearCompleted'],
      lastSchoolAttended: json['lastSchoolAttended'],
      lastSchoolID: json['lastSchoolID'],
      semester: json['semester'],
      track: json['track'],
      strand: json['strand'],
    );
  }

// Map<String, dynamic> toJson() => {
//       'name': name,
//       'age': age,
//     };
}
