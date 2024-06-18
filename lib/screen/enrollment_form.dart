//
// import 'package:atienrollmentapp/widgets/birthplace_picker.dart';
// import 'package:atienrollmentapp/widgets/gender_picker.dart';
// import 'package:atienrollmentapp/widgets/religion_picker.dart';
// import 'package:atienrollmentapp/widgets/student_status_picker.dart';
// import 'package:flutter/material.dart';
// import '../widgets/address_picker.dart';
//
// class EnrollmentFormScreen extends StatefulWidget {
//   const EnrollmentFormScreen({super.key});
//
//   @override
//   State<EnrollmentFormScreen> createState() => _EnrollmentFormScreenState();
// }
//
// class _EnrollmentFormScreenState extends State<EnrollmentFormScreen> {
//   final _formKey = GlobalKey<FormState>();
//   Color textColor = Colors.black;
//   Color buttonColor = Colors.black;
//   AddressPickerWidget placeOfBirth = const AddressPickerWidget();
//
//
//   DateTime selectedDate = DateTime.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         bottom: false,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                 child: Column(
//                   children: [
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             //email input field
//                             TextFormField(
//                               validator: (value) {
//                                 //phoneNumber = value.toString();
//                                 if (value!.isEmpty) {
//                                   return 'Phone number must not be empty.';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               decoration: InputDecoration(
//                                 // prefixIcon: Icon(
//                                 //   FontAwesomeIcons.phone,
//                                 //   color: textColor,
//                                 // ),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Phone number",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             //name input field
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "First Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             //name input field
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Middle Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             //name input field
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Last Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             //date of birth
//                             const Text("Birthdate", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Text("${selectedDate.toLocal()}".split(' ')[0]),
//                                 const SizedBox(height: 20.0,),
//                                 ElevatedButton(
//                                   onPressed: () => _selectDate(context),
//                                   child: const Text('Select date'),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const BirthplacePickerWidget(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const GenderSelection(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const AddressPickerWidget(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             //email input field
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "School last attended",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const ReligionPickerWidget(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Father's Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Father's Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Age",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Occupation",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Mother's Name",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Age",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Occupation",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Name of Guardian",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Relationship",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Address",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               // validator: (value) {
//                               //   phoneNumber = value.toString();
//                               //   if (value!.isEmpty) {
//                               //     return 'Phone number must not be empty.';
//                               //   } else if (!isPhoneNumberValid) {
//                               //     return 'The provided phone number is not valid.';
//                               //   } else {
//                               //     return null;
//                               //   }
//                               // },
//                               decoration: InputDecoration(
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: textColor),
//                                 ),
//                                 hintText: "Mobile no.",
//                                 hintStyle: TextStyle(
//                                   color: textColor.withAlpha(150),
//                                 ),
//                               ),
//                             ),
//                             //StatusSelection(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             ////////////stack fields on top of this////////////////
//                             SizedBox(
//                               width: double.maxFinite,
//                               child:
//                               //sign up button
//                               ElevatedButton(
//                                 onPressed: () async {
//                                   validateForm();
//                                   // Navigator.of(context).push(
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) => HomeScreen(),
//                                   //   ),
//                                   // );
//                                   // if (Navigator.canPop(context)) {
//                                   //   Navigator.pop(context);
//                                   // }
//                                 },
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                   WidgetStateProperty.all<Color>(buttonColor),
//                                   shape: WidgetStateProperty.all(
//                                     RoundedRectangleBorder(
//                                       // Change your radius here
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   'Enroll',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool validateForm() {
//     final FormState? form = _formKey.currentState;
//     bool isValid = false;
//     if (form!.validate()) {
//       print('Form is valid');
//       isValid = true;
//     } else {
//       print('Form is invalid');
//       isValid = false;
//     }
//     return isValid;
//   }
// }
