

import 'package:flutter/material.dart';

import '../functions/textfield_decoration.dart';

class IndegenousPicker extends StatefulWidget {
  const IndegenousPicker({super.key});

  @override
  State<IndegenousPicker> createState() => _IndegenousPickerState();
}

class _IndegenousPickerState extends State<IndegenousPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextFormField(
          validator: (value) {
            //phoneNumber = value.toString();
            if (value!.isEmpty) {
              return '';
            } else {
              return null;
            }
          },
          decoration: textfieldDecoration(Colors.black, "Please Specify"),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
