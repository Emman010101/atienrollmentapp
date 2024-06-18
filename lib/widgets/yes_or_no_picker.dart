
import 'package:flutter/material.dart';

import '../functions/textfield_decoration.dart';

enum YoN { yes, no}

class YesOrNoPicker extends StatefulWidget {
  var title;
  var ifyesTitle;
  YoN selectedValue = YoN.no;
  bool selectedVal = false;
  YesOrNoPicker({super.key, required this.title, required this.ifyesTitle});

  get getSelectedVal{
    String selectedValString = 'no';
    if(selectedVal == YoN.yes){
      selectedValString = 'yes';
    }
    return selectedValString;
  }

  @override
  _YesOrNoPickerState createState() => _YesOrNoPickerState();
}

class _YesOrNoPickerState extends State<YesOrNoPicker> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, style: const TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Yes'),
            leading: Radio<YoN>(
              value: YoN.yes,
              groupValue: widget.selectedValue,
              onChanged: (YoN? value) {
                setState(() {
                  widget.selectedValue = value!;
                  widget.selectedVal = true;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('No'),
            leading: Radio<YoN>(
              value: YoN.no,
              groupValue: widget.selectedValue,
              onChanged: (YoN? value) {
                setState(() {
                  widget.selectedValue = value!;
                  widget.selectedVal = false;
                });
              },
            ),
          ),
          widget.selectedVal ? TextFormField(
            validator: (value) {
              //phoneNumber = value.toString();
              if (value!.isEmpty) {
                return 'This must not be empty';
              } else {
                return null;
              }
            },
            decoration: textfieldDecoration(Colors.black, widget.ifyesTitle),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}