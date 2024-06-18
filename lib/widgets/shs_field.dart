

import 'package:atienrollmentapp/functions/textfield_decoration.dart';
import 'package:flutter/material.dart';

enum Sem {first, second, no}

class ShsField extends StatefulWidget {
  Sem selectedValue = Sem.no;
  String track = '';
  String strand = '';
  ShsField({super.key});

  get getSemester{
    var selectedVal = '';
    if(selectedValue == Sem.first){
      selectedVal = 'first';
    }else if(selectedValue == Sem.second){
      selectedVal = 'second';
    }
  }

  get getTrack{
    return track;
  }

  get getStrand{
    return strand;
  }

  @override
  State<ShsField> createState() => _ShsFieldState();
}

class _ShsFieldState extends State<ShsField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("For Learners in Senior High School", style: TextStyle(fontSize: 17),),
          SizedBox(
            height: 20,
          ),
          const Text("Semester", style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('1st Sem'),
            leading: Radio<Sem>(
              toggleable: true,
              value: Sem.first,
              groupValue: widget.selectedValue,
              onChanged: (Sem? value) {
                setState(() {
                  if(widget.selectedValue != Sem.no){
                    widget.selectedValue = Sem.no;
                  }else{
                    widget.selectedValue = value!;
                  }
                  //widget.selectedVal = true;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('2nd Sem'),
            leading: Radio<Sem>(
              toggleable: true,
              value: Sem.second,
              groupValue: widget.selectedValue,
              onChanged: (Sem? value) {
                setState(() {
                  if(widget.selectedValue != Sem.no){
                    widget.selectedValue = Sem.no;
                  }else{
                    widget.selectedValue = value!;
                  }
                  //widget.selectedVal = false;
                });
              },
            ),
          ),
          TextFormField(
            validator: (value) {

              if (value!.isEmpty) {
                return null;
              } else {
                widget.track = value.toString();
                return null;
              }
            },
            decoration: textfieldDecoration(Colors.black, "Track"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {

              if (value!.isEmpty) {
                return null;
              } else {
                widget.strand = value.toString();
                return null;
              }
            },
            decoration: textfieldDecoration(Colors.black, "Strand"),
          ),
        ],
      ),
    );
  }
}
