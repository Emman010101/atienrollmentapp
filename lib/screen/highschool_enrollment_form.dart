import 'dart:async';
import 'dart:convert';

import 'package:atienrollmentapp/functions/change_screen.dart';
import 'package:atienrollmentapp/functions/close_screen.dart';
import 'package:atienrollmentapp/functions/snackbar.dart';
import 'package:atienrollmentapp/functions/textfield_decoration.dart';
import 'package:atienrollmentapp/screen/camera_screen.dart';
import 'package:atienrollmentapp/widgets/current_address_picker.dart';
import 'package:atienrollmentapp/widgets/gender_picker.dart';
import 'package:atienrollmentapp/widgets/lrnreturning_picker.dart';
import 'package:atienrollmentapp/widgets/shs_field.dart';
import 'package:atienrollmentapp/widgets/yes_or_no_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/database.dart';
import '../functions/is_user_enrolled.dart';
import '../globalvars/globalvars.dart';
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
  //


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

  @override
  Widget build(BuildContext context) {
    //print(year + '-' + (int.parse(year)+1).toString());
    //print(_isUserEnrolled());
    schoolYear = '$year-${int.parse(year) + 1}';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
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
                                        changeScreen(context, CameraScreen());
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
