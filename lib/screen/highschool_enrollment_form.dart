import 'dart:async';
import 'dart:convert';

import 'package:atienrollmentapp/functions/change_screen.dart';
import 'package:atienrollmentapp/functions/snackbar.dart';
import 'package:atienrollmentapp/functions/textfield_decoration.dart';
import 'package:atienrollmentapp/screen/camera_screen.dart';
import 'package:atienrollmentapp/widgets/current_address_picker.dart';
import 'package:atienrollmentapp/widgets/gender_picker.dart';
import 'package:atienrollmentapp/widgets/lrnreturning_picker.dart';
import 'package:atienrollmentapp/widgets/shs_field.dart';
import 'package:atienrollmentapp/widgets/yes_or_no_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../widgets/address_picker.dart';
import '../widgets/permanent_address.dart';

class HighschoolEnrollmentForm extends StatefulWidget {
  const HighschoolEnrollmentForm({super.key});

  @override
  State<HighschoolEnrollmentForm> createState() =>
      _HighschoolEnrollmentFormState();
}

class _HighschoolEnrollmentFormState extends State<HighschoolEnrollmentForm> {
  final _formKey = GlobalKey<FormState>();
  Color textColor = Colors.black;
  Color buttonColor = Colors.black;
  bool isLoading = false;
  //
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

  GenderSelection genderSelection =
      GenderSelection(title: "Select your gender");
  YesOrNoPicker ipYesOrNoPicker = YesOrNoPicker(
    title:
        "Belonging to any Indigenous Peoples (IP) Community/Indigenous Cultural Community?",
    ifyesTitle: "Please specify",
  );
  YesOrNoPicker fourPsYesOrNoPicker = YesOrNoPicker(
      title: "Is your family a beneficiary of 4Ps",
      ifyesTitle: "4P's Household ID Number");
  AddressPickerWidget placeOfBirthPickerWidget = AddressPickerWidget(
    title: "Place of Birth",
    showBarangay: false,
  );
  PermanentAddressPicker permanentAddressPicker = PermanentAddressPicker();
  CurrentAddressPicker currentAddressPicker = CurrentAddressPicker(
    title: 'Current Address',
  );
  LrnReturningPickerWidget lrnReturningPickerWidget =
      LrnReturningPickerWidget();
  ShsField shsField = ShsField();

  DateTime selectedDate = DateTime.now();

  // Format the date if necessary
  String year = DateFormat('yyyy').format(DateTime.now());

  String schoolYear = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDate = selectedDate.toString();
      });
    }
  }
  //ip for emulator 10.0.2.2
  var url = Uri.http("192.168.1.29", "atienrollmentsystemapi/enroll.php");
  //var url = Uri.http("${Env.URL_PREFIX}/enroll.php");
  // Http post request to enroll the student
  Future _enrollStudent() async {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(year + '-' + (int.parse(year)+1).toString());
    schoolYear = '$year-${int.parse(year) + 1}';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(),
            SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //input field
                              //   Row(
                              //     children: [
                              //       Expanded(
                              //           child: TextFormField(
                              //             validator: (value) {
                              //               //phoneNumber = value.toString();
                              //               if (value!.isEmpty) {
                              //                 return 'Phone number must not be empty.';
                              //               } else {
                              //                 return null;
                              //               }
                              //             },
                              //             decoration: textfieldDecoration(textColor, "School Year"),
                              //           ),
                              //       ),
                              //       const SizedBox(
                              //         width: 10,
                              //       ),
                              //       Expanded(
                              //         child: TextFormField(
                              //           validator: (value) {
                              //             //phoneNumber = value.toString();
                              //             if (value!.isEmpty) {
                              //               return 'Phone number must not be empty.';
                              //             } else {
                              //               return null;
                              //             }
                              //           },
                              //           decoration: textfieldDecoration(textColor, "School Year"),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              //input field
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    gradeLevelToEnroll = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Grade level to Enroll"),
                                keyboardType: TextInputType.number,
                                autofocus: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              lrnReturningPickerWidget,
                              const SizedBox(
                                height: 20,
                              ),
                              //input field
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    //return 'This must not be empty';
                                    return null;
                                  } else {
                                    psaBirthCertNo = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "PSA Birth Certificate No."),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (lrnReturningPickerWidget
                                          .getWithLrnValue ==
                                      'yes') {
                                    if (value!.isEmpty) {
                                      return 'This must not be empty.';
                                    } else {
                                      lrn = value.toString();
                                      return null;
                                    }
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Learner Reference No. (LRN)"),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    lastName = value.toString();
                                    return null;
                                  }
                                },
                                decoration:
                                    textfieldDecoration(textColor, "Last Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    firstName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "First Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    middleName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Middle Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    extensionName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(textColor,
                                    "Extension Name e.g Jr., III (if applicable)"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Birthdate",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _selectDate(context),
                                    child: const Text('Select date'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              placeOfBirthPickerWidget,
                              const SizedBox(
                                height: 20,
                              ),
                              //gender selection
                              genderSelection,
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    age = value.toString();
                                    return null;
                                  }
                                },
                                decoration:
                                    textfieldDecoration(textColor, "Age"),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This must not be empty.';
                                  } else {
                                    motherTongue = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Mother Tongue"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ipYesOrNoPicker,
                              fourPsYesOrNoPicker,
                              const SizedBox(
                                height: 20,
                              ),
                              currentAddressPicker,
                              permanentAddressPicker,
                              const Text(
                                "Father's Name",
                                style: TextStyle(fontSize: 17),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    fatherLastName = value.toString();
                                    return null;
                                  }
                                },
                                decoration:
                                    textfieldDecoration(textColor, "Last Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    fatherFirstName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "First Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    fatherMiddleName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Middle Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    fatherContactNum = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Contact Number"),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Mother's Maiden Name",
                                style: TextStyle(fontSize: 17),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    motherLastName = value.toString();
                                    return null;
                                  }
                                },
                                decoration:
                                    textfieldDecoration(textColor, "Last Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    motherFirstName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "First Name"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    motherMiddleName = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Middle Name"),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else {
                                    motherContactNum = value.toString();
                                    return null;
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Contact Number"),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "For Returning Learner (Balik-Aral) and Those who will Transfer/Move In",
                                style: TextStyle(fontSize: 17),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (lrnReturningPickerWidget
                                          .getReturningValue ==
                                      'yes') {
                                    if (value!.isEmpty) {
                                      return 'This must not be empty';
                                    } else {
                                      lastGradeLevelCompleted =
                                          value.toString();
                                      return null;
                                    }
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Last Grade Level Completed"),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (lrnReturningPickerWidget
                                          .getReturningValue ==
                                      'yes') {
                                    if (value!.isEmpty) {
                                      return 'This must not be empty.';
                                    } else {
                                      lastSchoolYearCompleted =
                                          value.toString();
                                      return null;
                                    }
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Last School Year Completed"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (lrnReturningPickerWidget
                                          .getReturningValue ==
                                      'yes') {
                                    if (value!.isEmpty) {
                                      return 'This must not be empty.';
                                    } else {
                                      lastSchoolAttended = value.toString();
                                      return null;
                                    }
                                  }
                                },
                                decoration: textfieldDecoration(
                                    textColor, "Last School Attended"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (lrnReturningPickerWidget
                                          .getReturningValue ==
                                      'yes') {
                                    if (value!.isEmpty) {
                                      return 'This must not be empty.';
                                    } else {
                                      lastSchoolID = value.toString();
                                      return null;
                                    }
                                  }
                                },
                                decoration:
                                    textfieldDecoration(textColor, "School ID"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              shsField,
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom)),
                              ////////////////stack fields on top of this comment/////////////////////
                              SizedBox(
                                width: double.maxFinite,
                                child:
                                    //enroll button
                                    ElevatedButton(
                                  onPressed: () async {
                                    //validateForm();
                                    if (validateForm()) {
                                      gender =
                                          genderSelection.getSelectedGender ??
                                              '';
                                      indigenousPeople =
                                          ipYesOrNoPicker.getSelectedVal ?? '';
                                      fourPsBeneficiary =
                                          fourPsYesOrNoPicker.getSelectedVal ??
                                              '';
                                      pRegion =
                                          placeOfBirthPickerWidget.getRegion ??
                                              '';
                                      pProvince = placeOfBirthPickerWidget
                                              .getProvince ??
                                          '';
                                      pMunicipality = placeOfBirthPickerWidget
                                              .getMunicipality ??
                                          '';
                                      cBarangay =
                                          currentAddressPicker.getBarangay ??
                                              '';
                                      cMunicipality = currentAddressPicker
                                              .getMunicipality ??
                                          '';
                                      cProvince =
                                          currentAddressPicker.getProvince ??
                                              '';
                                      cRegion =
                                          currentAddressPicker.getRegion ?? '';
                                      cHouseNoStreet =
                                          currentAddressPicker.getHouseNo ?? '';
                                      cStreetName =
                                          currentAddressPicker.getStreetName ??
                                              '';
                                      cZipCode =
                                          currentAddressPicker.getZipCode ?? '';
                                      if (permanentAddressPicker
                                          .getSelectedValue) {
                                        perBarangay = cBarangay;
                                        perMunicipality = cMunicipality;
                                        perProvince = cProvince;
                                        perRegion = pRegion;
                                        perHouseNoStreet = cHouseNoStreet;
                                        perStreetName = cStreetName;
                                        perZipCode = cZipCode;
                                      } else {
                                        perBarangay = permanentAddressPicker
                                                .getBarangay ??
                                            '';
                                        perMunicipality = permanentAddressPicker
                                                .getMunicipality ??
                                            '';
                                        perProvince = permanentAddressPicker
                                                .getProvince ??
                                            '';
                                        perRegion =
                                            permanentAddressPicker.getRegion ??
                                                '';
                                        perHouseNoStreet =
                                            permanentAddressPicker.getHouseNo ??
                                                '';
                                        perStreetName = permanentAddressPicker
                                                .getStreetName ??
                                            '';
                                        perZipCode =
                                            permanentAddressPicker.getZipCode ??
                                                '';
                                      }
                                      //lrnReturningPickerWidget
                                      withLrn = lrnReturningPickerWidget
                                              .getWithLrnValue ??
                                          '';
                                      balikAral = lrnReturningPickerWidget
                                              .getReturningValue ??
                                          '';
                                      semester = shsField.getSemester ?? '';
                                      track = shsField.getTrack ?? '';
                                      strand = shsField.getStrand ?? '';
                                      setState(() {
                                        isLoading = true;
                                      });
                                      //timer to stop circular progress indicator widget when there's a problem with http request
                                      // Timer? _timer;
                                      // int sec = 0;
                                      // _timer?.cancel(); // Cancel any existing timer
                                      // _timer = Timer.periodic(
                                      //     const Duration(seconds: 1),
                                      //     await (timer) {
                                      //       sec++;
                                      //       print('Seconds $sec');
                                      //       if (sec == 10) {
                                      //         sec = 0;
                                      //         snackBar(context,
                                      //             'Something went wrong. Please check your internet connection.');
                                      //         setState((){isLoading = false;});
                                      //         _timer?.cancel();
                                      //       }
                                      //     });
                                      try {
                                        var enroll = await _enrollStudent();

                                        // JSON string
                                        String jsonString =
                                            enroll.body.toString();

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
                                        changeScreen(context, CameraScreen());
                                      } catch (e) {
                                        print(e);
                                        snackBar(context,
                                            'Something went wrong. Please check your internet connection.');
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }else{
                                      snackBar(context, "Please ensure that all required fields are filled.");
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            buttonColor),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Enroll',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateForm() {
    final FormState? form = _formKey.currentState;
    bool isValid = false;
    if (form!.validate()) {
      print('Form is valid');
      isValid = true;
    } else {
      print('Form is invalid');
      isValid = false;
    }
    return isValid;
  }
}
