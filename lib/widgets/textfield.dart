

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final _formKey = GlobalKey<FormState>();
  Color textColor = Colors.black;
  Color buttonColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            //phoneNumber = value.toString();
            if (value!.isEmpty) {
              return 'Phone number must not be empty.';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   FontAwesomeIcons.phone,
            //   color: textColor,
            // ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: textColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: textColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: textColor),
            ),
            hintText: "Phone number",
            hintStyle: TextStyle(
              color: textColor.withAlpha(150),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
