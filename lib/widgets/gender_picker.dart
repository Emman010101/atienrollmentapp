
import 'package:flutter/material.dart';

enum Gender { male, female}

class GenderSelection extends StatefulWidget {
  var title;
  Gender selectedGender = Gender.male;
  GenderSelection({super.key, required this.title});

  get getSelectedGender{
    String gender = "Male";
    if(selectedGender == Gender.female){
      gender = "Female";
    }
    return gender;
  }

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, style: const TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Male'),
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: widget.selectedGender,
              onChanged: (Gender? value) {
                setState(() {
                  widget.selectedGender = value!;
                  print(value);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: widget.selectedGender,
              onChanged: (Gender? value) {
                setState(() {
                  widget.selectedGender = value!;
                  print(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}